/**
 * This script will build the realproperty table's content
 */

import tester.*

def conf = ['default.host': 'localhost:8080', 'app.context': 'sancarlos']
def proxy = new TestProxy(conf)

def svc = proxy.create('ScriptServiceAnalyzer')

svc.execute("""
    import com.rameses.sql.*
    import java.sql.*
    import java.util.concurrent.*

    def em = PERSISTENCE.create('main')
    def svc = SERVICE.create('RealPropertyService')
    
    ExecutorService execsvc = Executors.newFixedThreadPool(10);
    
    def fhandler = { faas ->
        execsvc.submit {
            println "processing faas: \${faas.objid}"
            
            def rp = em.serializer.read( faas.rp )
            rp.landfaasid = faas.objid
            svc.save( rp )

        } as Runnable
    }
    
    def qry = em.sqlContext.createQuery("select f.objid, f.rp from faas f, faaslist fl where f.objid = fl.objid and fl.rputype='land'")
    qry.fetchHandler = new CustomFetchHandler( handler: fhandler )
    qry.resultList
    
    
    class CustomFetchHandler extends MapFetchHandler {
        
        def handler;
    
        public Object getObject(ResultSet rs) throws Exception {
            def data = super.getObject( rs );
            if( handler ) handler( data );
            return null;
        }
        
    }

""")