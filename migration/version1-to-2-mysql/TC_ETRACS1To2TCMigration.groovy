import tester.*


def proxy = new TestProxy([
     'default.host' : '192.168.0.4:8080',
     'app.context'  : 'sancarlos',   
])

def svc = proxy.create('TCV1MigrationService') 

svc.updateAccount(null, 0)
println 'done updateAccount()...'

svc.updateRemittanceInfo()
println 'done updateRemittanceInfo()...'

svc.updateLiquidationInfo()
println 'done updateLiquidationInfo()...'

println 'done'