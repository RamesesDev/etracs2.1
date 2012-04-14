/*
 * ValueHandlerLookupModel.java
 *
 * Created on April 14, 2012, 4:56 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

/**
 *
 * @author Elmo
 */
public interface ValueHandlerLookupModel {
    String getItemObjid( Object selectedItem );
    String getItemName(Object selectedItem);
    String getLookupOpenerName();
    String getSelectHandlerName();
}
