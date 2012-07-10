import tester.*


def proxy = new TestProxy([
     'default.host' : 'localhost:8080',
     'app.context'  : 'bayombong',   
])

def svc = proxy.create('TCV1MigrationService') 

svc.updateAccount(null, 0)
println 'done updateAccount()...'

svc.updateRemittanceInfo()
println 'done updateRemittanceInfo()...'

svc.updateLiquidationInfo()
println 'done updateLiquidationInfo()...'

println 'done'