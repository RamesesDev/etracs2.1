import tester.*

System.setProperty("app.host", "192.168.0.4:8080")
System.setProperty("app.context", "sancarlos")
def proxy = new TestProxy([:]);

def ssa = proxy.create('ScriptServiceAnalyzer')
ssa.execute('''
    import com.rameses.util.*
    import com.rameses.sql.*
    import javax.naming.*

    try {
        def sql = SQL.create("main")
        def list = sql.createQuery(" select objid,uid from useraccount where pwd = '' or pwd is null ").resultList
        list.each{
            println "updating pwd for $it.uid"
            def pwd = Encoder.MD5.encode( "1234", it.uid )
            sql.createExecutor('update useraccount set pwd=? where objid=?').setParameter(1, pwd).setParameter(2, it.objid).execute()
        }
    }
    catch(e) {
        e.printStackTrace()
    }

''')
println 'done'


