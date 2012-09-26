<%@ page import="org.apache.tools.ant.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rameses.util.*" %>

<%!
Properties loadDBInfo( String dbscheme, String dbhost ) throws Exception
{
	Properties p = new Properties();
	if( "mysql".equals(dbscheme) ) {
		p.setProperty( "db_url", "jdbc:mysql://" +dbhost+ "/mysql" );
		p.setProperty( "db_dialect", "com.rameses.sql.dialect.MySqlDialect" );
		p.setProperty( "db_driver", "com.mysql.jdbc.Driver" );
	}
	else if( "mssql".equals(dbscheme) ) {
		p.setProperty( "db_url", "jdbc:sqlserver://" +dbhost+ ";DatabaseName=tempdb" );
		p.setProperty( "db_dialect", "com.rameses.sql.dialect.MsSqlDialect" );
		p.setProperty( "db_driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver" );
	}
	else {
		throw new Exception("Database scheme not yet supported.");
	}
	
	return p;
}
%>


<%
	//check if already installed
	String appname = request.getParameter("appname");
	String server_port = request.getParameter("server_port");
	String server_ip = request.getParameter("server_ip");
	String server_address = server_ip;
	if( server_port != null && server_port.length() > 0 ) {
		server_address += ":" + server_port;
	}
	
	File f = new File(System.getProperty( "jboss.server.home.dir" ) + "/apps/" + appname + ".ear");
	
	if( f.exists() ) 
	{
		out.write("Error: <u><b>" + appname + "</b></u> ERACS Server is already installed.");
	}
	else 
	{
		//test mysql connection first
		String dbhost = request.getParameter("dbhost");
		String dbuser = request.getParameter("dbuser");
		String dbpwd = request.getParameter("dbpwd");
		String dbscheme = request.getParameter("dbscheme");
		Properties dbinfo = loadDBInfo( dbscheme, dbhost );
		
		boolean hasError = false;
		Connection conn = null;
		
		try {
			Class.forName(dbinfo.getProperty("db_driver"));
			conn = DriverManager.getConnection(dbinfo.getProperty("db_url"), dbuser, dbpwd);
		}
		catch(Exception e) {
			System.out.println( e.getMessage() );
			out.write("Error: " + e.getMessage() );
			hasError = true;
		}
		
		if( !hasError ) 
		{
			try {
				File build = new File(System.getProperty( "jboss.server.home.dir" ) + "/apps/install.war/res/build.xml");
				Project p = new Project();
				p.setUserProperty( "ant.file", build.getAbsolutePath() );
				p.setUserProperty( "rootpath", System.getProperty( "jboss.server.home.dir" )+"/apps" );
				p.setUserProperty( "appname", appname  );
				p.setUserProperty( "apphost", "localhost:8080" );
				p.setUserProperty( "lguname", request.getParameter("lguname")  );
				p.setUserProperty( "server_address", server_address  );
				
				p.setUserProperty( "main_dbname", appname + "_etracs"  );
				p.setUserProperty( "system_dbname", appname + "_system"  );	
				p.setUserProperty( "db_host", dbhost  );
				p.setUserProperty( "db_user", dbuser  );
				p.setUserProperty( "db_pwd", dbpwd );
				p.setUserProperty( "db_scheme", dbscheme );
				
				Iterator itr = dbinfo.entrySet().iterator();
				while( itr.hasNext() ) {
					Map.Entry me = (Map.Entry) itr.next();
					p.setUserProperty( me.getKey()+"", me.getValue()+"" );
				}
				
				//so we can monitor logs in the console
				DefaultLogger logger = new DefaultLogger();
				logger.setOutputPrintStream( System.out );
				logger.setErrorPrintStream(System.err);
				logger.setMessageOutputLevel(Project.MSG_INFO);
				p.addBuildListener(logger);
				
				try {
					p.fireBuildStarted();
					p.init();
					ProjectHelper helper = ProjectHelper.getProjectHelper();
					p.addReference("ant.projectHelper", helper);
					helper.parse(p, build);
					p.executeTarget(p.getDefaultTarget());
					p.fireBuildFinished(null);
				} catch (BuildException e) {
					e.printStackTrace();
					p.fireBuildFinished(e);
					out.write("Failed to install the server. Error Message: " + e.getMessage());
					hasError = true;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		
		if( conn != null && !hasError ) 
		{
			try {
				String maindb = appname + "_etracs";
				String systemdb = appname + "_system";
				
				conn.setCatalog(maindb);
				PreparedStatement ps = conn.prepareStatement("update useraccount set uid=?, pwd=? where objid=?");
				String uid = request.getParameter("adminuser");
				String pwd = request.getParameter("adminpwd");
				ps.setString(1, uid);
				ps.setString(2, Encoder.MD5.encode(pwd, uid));
				ps.setString(3, "admin");
				ps.executeUpdate();
				
				conn.setCatalog(systemdb);
				Statement stm = conn.createStatement();
				stm.executeUpdate("delete from sys_var where name = 'server_address'");
				stm.executeUpdate("insert into sys_var(name,value) select 'server_address', '" +server_address+ "'");
			} 
			catch(Exception e) {
				out.write("Error: " + e.getMessage());
				hasError = true;
			}
			
			try{ conn.close(); }catch(Exception e){}
		}
		
		if( !hasError ) {
			File file  = new File( System.getProperty("jboss.server.home.dir") + "/apps/install.war/installed" );
			file.createNewFile();
			out.write("DONE");
		}
	}
%>