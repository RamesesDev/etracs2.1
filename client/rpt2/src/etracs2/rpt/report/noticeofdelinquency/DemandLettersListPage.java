/*
 * AccountPage.java
 *
 * Created on February 27, 2011, 12:48 PM
 */

package etracs2.rpt.report.noticeofdelinquency;

import com.rameses.rcp.ui.annotations.StyleSheet;

@StyleSheet("etracs2/rpt/report/noticeofdelinquency/NewDemandLettersPage.style")
public class DemandLettersListPage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public DemandLettersListPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xButton3 = new com.rameses.rcp.control.XButton();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xButton1 = new com.rameses.rcp.control.XButton();
        xButton2 = new com.rameses.rcp.control.XButton();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(748, 396));
        jPanel1.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Listing");
        jPanel1.setBorder(xTitledBorder1);
        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel3.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 1, 3, 5));
        jPanel5.setLayout(new java.awt.BorderLayout());

        jPanel5.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        jPanel4.setLayout(new java.awt.BorderLayout());

        jPanel5.add(jPanel4, java.awt.BorderLayout.WEST);

        jPanel3.add(jPanel5, java.awt.BorderLayout.CENTER);

        formPanel2.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel2.setPreferredSize(new java.awt.Dimension(500, 32));
        xButton3.setMnemonic('g');
        xButton3.setText("Generate");
        xButton3.setCaption("Select All");
        xButton3.setName("generateprint");
        xButton3.setPreferredSize(new java.awt.Dimension(80, 23));
        xButton3.setShowCaption(false);
        formPanel2.add(xButton3);

        jPanel3.add(formPanel2, java.awt.BorderLayout.SOUTH);

        jPanel1.add(jPanel3, java.awt.BorderLayout.NORTH);

        xDataTable1.setHandler("listHandler");
        xDataTable1.setName("selectedItem");
        jPanel1.add(xDataTable1, java.awt.BorderLayout.CENTER);

        formPanel1.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel1.setPreferredSize(new java.awt.Dimension(500, 32));
        xButton1.setMnemonic('s');
        xButton1.setText("Select All");
        xButton1.setCaption("Select All");
        xButton1.setName("selectAll");
        xButton1.setPreferredSize(new java.awt.Dimension(80, 23));
        xButton1.setShowCaption(false);
        formPanel1.add(xButton1);

        xButton2.setMnemonic('d');
        xButton2.setText("Deselect All");
        xButton2.setCaption("Deselect All");
        xButton2.setName("deselectAll");
        xButton2.setPreferredSize(new java.awt.Dimension(100, 23));
        xButton2.setShowCaption(false);
        formPanel1.add(xButton2);

        jPanel1.add(formPanel1, java.awt.BorderLayout.SOUTH);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XButton xButton3;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    // End of variables declaration//GEN-END:variables
    
}
