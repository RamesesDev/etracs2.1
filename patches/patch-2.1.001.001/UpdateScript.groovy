import tester.*

int BATCHSIZE = 25
int THREAD_COUNT = 20
def g_errorlist = []

def getNextFAASBatch( faaslist, size) {
    def batch = []
    if( faaslist.size() >= size ) {
        faaslist[0..(size-1)].each{ batch.add(it) }
    }
    else if( faaslist.size() > 0 )  {
        faaslist.each{ batch.add(it) }
    }
    faaslist.removeAll( batch )
    return batch
}

def executeAction = { action, faaslist ->
    int batchno = 0
    def faasbatch = getNextFAASBatch( faaslist, BATCHSIZE)
    while( faasbatch ) {
        println 'processing batch -> ' + (++batchno)
        action( faasbatch )
        faasbatch = getNextFAASBatch( faaslist , BATCHSIZE)
        
    }
}

def executeAction2 = { action, faaslist ->
    int batchno = 0
    
    def faasbatch = getNextFAASBatch( faaslist, BATCHSIZE)
    while( faasbatch ) {
        def batchlist = [ faasbatch ]
        1.upto(THREAD_COUNT-1) {
            batchlist[it] = getNextFAASBatch(faaslist, BATCHSIZE)
        }
        batchlist.each{ batch ->
            if( batch ) {
                println 'processing batch ' + (++batchno)
                Thread.start{ action( batch ) }
            }
        }
        
        println 'waiting for all tasks to be done...'
        while( batchlist.findAll{ it != null && it.size() > 0 } ) {
            Thread.sleep(200)
        }
        
        faasbatch = getNextFAASBatch( faaslist, BATCHSIZE)
    }
}

void printDone( action, g_errorlist ){
    println '-'*50
    println action
    println 'Error Listing'
    g_errorlist.each{ println it }
    g_errorlist = []
    println '-'*50
}


def proxy = new TestProxy([
     'default.host' : 'localhost:8080',
     'app.context'  : 'municipality',   
])

def svc = proxy.create('XPatchService01')


executeAction2({  g_errorlist.addAll(svc.updateFaasPreviousInfo( it )); it.clear() }, svc.getFAASList() )
printDone( 'done svc.updateFaasPreviousInfo...', g_errorlist )


println 'done' 