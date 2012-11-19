/*
 * Main.java
 *
 * Created on June 1, 2011, 12:25 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rptbilling.rule.action;

import com.rameses.osiris2.test.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws Exception {
        Map roles = new HashMap();
        roles.put("RPT.MASTER_ENCODER", null);
        roles.put("RPT.APPRAISER", null);
        roles.put("RPT.CITY_ASSESSOR", null);
        roles.put("RPT.PROVINCIAL_ASSESSOR", null);
        roles.put("RPT.MUNICIPAL_ASSESSOR", null);
        roles.put("RPT.LANDTAX", null );
        roles.put("RPT.ASSESSOR_REPORTS", null);
        roles.put("RPT.SHARED", null);
        roles.put("RPT.RULE_AUTHOR", null);
        
        Map env = new HashMap();
        env.put("app.title", "Tester");
        env.put("app.host", "192.168.56.1");
        env.put("app.context", "municipality");
        OsirisTestPlatform.runTest( env , roles );
    }    
}

