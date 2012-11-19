package etracs2.tc.main;


import com.rameses.osiris2.test.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws Exception {
        Map roles = new HashMap();
        roles.put("TREASURY.COLLECTOR", null);
        roles.put("TREASURY.AFO", null);
        roles.put("TREASURY.MASTER_ENCODER", null);
        roles.put("TREASURY.LIQUIDATING_OFFICER", null);
        roles.put("TREASURY.CASHIER", null);
        roles.put("TREASURY.TREASURY_REPORTS", null);
        
        Map env = new HashMap();
        env.put("app.title", "Tester");
        env.put("app.host", "192.168.56.1");
        env.put("app.context", "municipality");
        OsirisTestPlatform.runTest( env , roles );
    }    
}
