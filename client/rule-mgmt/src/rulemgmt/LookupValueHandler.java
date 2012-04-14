package rulemgmt;

import com.rameses.osiris2.client.InvokerUtil;
import com.rameses.rcp.framework.Binding;
import groovy.lang.Closure;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Elmo
 */
public abstract class LookupValueHandler extends ValueHandler {
    
    @com.rameses.rcp.annotations.Binding
    Binding binding;
    
    public abstract ValueHandlerLookupModel getHandler();
    
    public Object lookup() {
        Closure h = new Closure(this) {
            public Object call(Object[] args) {
                if( args.length > 0 ) {
                    setValue(args[0]);
                }
                binding.refresh();
                return null;
            }            
        };
        
        Map m = new HashMap();
        m.put("handler", getHandler());
        m.put("selectHandler", h);
        return InvokerUtil.lookupOpener( "value_handler:lookup", m );
    }
    
    public String getDisplaytext() {
        Object value = getValue();
        
        if( value == null ) return "";
        if( !(value instanceof Collection) ) return value+"";
        
        StringBuffer sb = new StringBuffer();
        boolean first = true;
        for(Object o : (Collection) value) {
            if( !first ) 
                sb.append(", ");
            else 
                first = false;
            
            Map m = (Map) o;
            sb.append( m.get("name") );
        }
        return sb.toString();
    }

}
