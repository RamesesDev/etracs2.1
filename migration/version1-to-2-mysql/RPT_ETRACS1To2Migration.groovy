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

def executeAction2 = { action, faaslist, processname ->
    int batchno = 0
    
    def faasbatch = getNextFAASBatch( faaslist, BATCHSIZE)
    while( faasbatch ) {
        def batchlist = [ faasbatch ]
        1.upto(THREAD_COUNT-1) {
            batchlist[it] = getNextFAASBatch(faaslist, BATCHSIZE)
        }
        batchlist.each{ batch ->
            if( batch ) {
                println processname + ': processing batch ' + (++batchno)
                Thread.start{ action( batch ) } as Runnable
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
    try {
        println '-'*50
        println action
        println 'Error Listing'
        g_errorlist.each{ println it }
        g_errorlist = []
        println '-'*50
    }
    catch(e) {
        println 'error in printing print done'
    }
    g_errorlist = []
}


def proxy = new TestProxy([
     'default.host' : 'localhost:8080',
     'app.context'  : 'sancarlos',   
])

def svc = proxy.create('RPTV1MigrationService')

/*
svc.updateLandFaasIdInfo()
println 'done svc.updateLandFaasIdInfo()...'

executeAction2({  g_errorlist.addAll(svc.updateFAASInfo( it )); it.clear() }, svc.getFAASList(), 'faasinfo' )
printDone( 'done svc.updateFAASInfo()...', g_errorlist )

executeAction2({  g_errorlist.addAll(svc.updateFAASRealPropertyInfo( it )); it.clear() }, svc.getFAASList(), 'faas real property info' )
printDone('done svc.updateFAASRealPropertyInfo()...', g_errorlist )

executeAction2({  g_errorlist.addAll(svc.updateFAASLandRPUInfo( it )); it.clear() }, svc.getFAASListByType('land'), 'faas land rpu info' )
printDone ('done svc.updateFAASLandRPUInfo()...', g_errorlist)


executeAction2({  g_errorlist.addAll(svc.updateFAASBldgRPUInfo( it )); it.clear() }, svc.getFAASListByType('bldg'), 'faas bldg rpu info' )
printDone('done svc.updateFAASBldgRPUInfo()...', g_errorlist)


executeAction2({  g_errorlist.addAll(svc.updateFAASMachRPUInfo( it )); it.clear() }, svc.getFAASListByType('mach'), 'faas mach rpu info' )
printDone('done svc.updateFAASMachRPUInfo()...', g_errorlist)


svc.updateMachAssessLevelRanges()
println 'done svc.updateMachAssessLevelRanges()...'


svc.updateMultipleEntityInfo()
println 'done svc.updateMultipleEntityInfo()...'


executeAction2(
    { 
        svc.updateIndividualEntityInfo( it )
        it.clear() 
    }, 
    svc.getIndividualEntityList(),
    'individual entity info'
)
println 'done svc.updateIndividualEntityInfo()...'



svc.loadPlantTreeRYSettingInfos()
println 'done svc.loadPlantTreeRYSettingInfos()...'


svc.updateBldgAdditionalItemExpr()
println 'done svc.updateBldgAdditionalItemExpr()...'


svc.loadBldgDepreciationSchedules()
println 'done svc.loadBldgDepreciationSchedules()...'


svc.updateBldgKindBuccExtended()
println 'done svc.updateBldgKindBuccExtended()...'


svc.updateBldgAssessLevelRanges()
println 'done svc.updateBldgAssessLevelRanges()...'


svc.updateLandAssessLevelRanges()
println 'done svc.updateLandAssessLevelRanges()...'


svc.updateStructureMaterials()
println 'done svc.updateStructureMaterials()...'


executeAction2( { g_errorlist.addAll( svc.insertRPTLedger( it )) ; it.clear() }, svc.getLedgerList(), 'insert rpt ledger' )
printDone( 'done svc.insertRPTLedger()...', g_errorlist )


executeAction2({ g_errorlist.addAll(svc.insertRPTLedgerItem( it )); it.clear() }, svc.getLedgerItemList(), 'insert rpt ledger item' )
printDone( 'done svc.insertRPTLedgerItem()...', g_errorlist )
*/

println 'done' 