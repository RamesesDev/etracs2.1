/*
 * Main.java
 *
 * Created on June 1, 2011, 12:25 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bpassessment.rule;

import com.rameses.osiris2.test.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws Exception {
        Map roles = new HashMap();
        roles.put("BP.MASTER_ENCODER", null);
        roles.put("BP.BP_REPORTS",null);
        roles.put("BP.LICENSING", null);
        roles.put("BP.RELEASING", null);
        roles.put("BP.SHARED", null);
        roles.put("BP.COLLECTOR", null);
        roles.put("BP.RULE_AUTHOR", null);
        
        Map env = new HashMap();
        env.put("app.title", "Tester");
        env.put("app.host", "192.168.56.1");
        env.put("app.context", "municipality");
        OsirisTestPlatform.runTest( env , roles );
    }    
}

