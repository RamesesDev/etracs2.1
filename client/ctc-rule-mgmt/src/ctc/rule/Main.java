/*
 * Main.java
 *
 * Created on June 1, 2011, 12:25 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package ctc.rule;

import com.rameses.osiris2.test.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws Exception {
        Map roles = new HashMap();
        roles.put("CTC.RULE_AUTHOR", null);
        
        Map env = new HashMap();
        env.put("app.title", "Tester");
        env.put("app.host", "192.168.56.1");
        env.put("app.context", "municipality");
        OsirisTestPlatform.runTest( env , roles );
    }    
}

