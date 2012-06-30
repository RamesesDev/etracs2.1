import tester.*

def proxy = new TestProxy([
     'default.host' : 'localhost:8080',
     'app.context'  : 'sancarlos',   
])


def svc = proxy.create('BPV1MigrationService')
/*
svc.cleanupRuleConditions()
println 'done cleanupRuleConditions()'

svc.migrateApplicationTypeConditions()
println 'done migrateApplicationTypeConditions()'

svc.migrateLobClassificationConditions()
println 'done migrateLobClassificationConditions()'

svc.migrateBusinessOrgConditions()
println 'done migrateBusinessOrgConditions()'

svc.migrateOfficeTypeConditions()
println 'done migrateOfficeTypeConditions()'

svc.migrateBarangayConditions()
println 'done migrateBarangayConditions()'

svc.migrateLobConditions()
println 'done migrateLobConditions()'

svc.migrateVariableConditions()
println 'done migrateVariableConditions()'

svc.migrateTaxFeeConditions()
println 'done migrateTaxFeeConditions()'

svc.cleanupRuleAction() 
println 'done cleanupRuleAction()'

svc.migrateAskInfoAction()
println 'done migrateAskInfoAction()'

svc.migrateTaxFeeChargeFormulaModeAction()
println 'done migrateTaxFeeChargeFormulaModeAction()'

svc.migrateTaxFeeChargeRangeModeAction()
println 'done migrateTaxFeeChargeRangeModeAction()'

svc.migrateUpdateAmountDueAction()
println 'done migrateUpdateAmountDueAction()'
*/
def messages = svc.deployRules()
if( messages ) println( 'messages:\n' + messages.join('\n') )
println 'don deploying deployed rules'

//svc.updateBPReceivables()
//println 'don updating bp receivables'


println 'finished'