/*
 * AccountPage.java
 *
 * Created on February 27, 2011, 12:48 PM
 */

package etracs2.bp.application;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
public class BusinessMmgtPage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public BusinessMmgtPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jSplitPane1 = new javax.swing.JSplitPane();
        jPanel1 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        jPanel8 = new javax.swing.JPanel();
        xActionTextField3 = new com.rameses.rcp.control.XActionTextField();
        xDataTable3 = new com.rameses.rcp.control.XDataTable();
        xActionBar3 = new com.rameses.rcp.control.XActionBar();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        xEditorPane1 = new com.rameses.rcp.control.XEditorPane();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(748, 396));
        jSplitPane1.setDividerLocation(300);
        jSplitPane1.setOrientation(javax.swing.JSplitPane.VERTICAL_SPLIT);
        jPanel1.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Listing");
        jPanel1.setBorder(xTitledBorder1);
        jPanel1.setPreferredSize(new java.awt.Dimension(204, 100));
        jPanel7.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Listing");
        jPanel7.setBorder(xTitledBorder2);
        jPanel7.setPreferredSize(new java.awt.Dimension(204, 100));
        jPanel8.setLayout(new java.awt.BorderLayout());

        jPanel8.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 1, 3, 5));
        xActionTextField3.setActionName("search");
        xActionTextField3.setName("searchText");
        xActionTextField3.setPreferredSize(new java.awt.Dimension(150, 19));
        jPanel8.add(xActionTextField3, java.awt.BorderLayout.WEST);

        jPanel7.add(jPanel8, java.awt.BorderLayout.NORTH);

        xDataTable3.setDynamic(true);
        xDataTable3.setHandler("listHandler");
        xDataTable3.setImmediate(true);
        xDataTable3.setName("selectedItem");
        jPanel7.add(xDataTable3, java.awt.BorderLayout.CENTER);

        jPanel1.add(jPanel7, java.awt.BorderLayout.CENTER);

        xActionBar3.setDepends(new String[] {"selectedItem"});
        xActionBar3.setFont(new java.awt.Font("Arial", 0, 12));
        xActionBar3.setName("formActions");
        jPanel1.add(xActionBar3, java.awt.BorderLayout.NORTH);

        jSplitPane1.setLeftComponent(jPanel1);

        jPanel2.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Document");
        jPanel2.setBorder(xTitledBorder3);
        xEditorPane1.setDepends(new String[] {"selectedItem"});
        xEditorPane1.setName("html");
        jScrollPane1.setViewportView(xEditorPane1);

        jPanel2.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        jSplitPane1.setRightComponent(jPanel2);

        add(jSplitPane1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionBar xActionBar3;
    private com.rameses.rcp.control.XActionTextField xActionTextField3;
    private com.rameses.rcp.control.XDataTable xDataTable3;
    private com.rameses.rcp.control.XEditorPane xEditorPane1;
    // End of variables declaration//GEN-END:variables
    
}
