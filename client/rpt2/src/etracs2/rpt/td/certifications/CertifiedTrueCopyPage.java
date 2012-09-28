/*
 * AccountPage.java
 *
 * Created on February 27, 2011, 12:48 PM
 */

package etracs2.rpt.td.certifications;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
@StyleSheet("etracs2/rpt/td/certifications/CertifiedTrueCopyPage.style")
public class CertifiedTrueCopyPage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public CertifiedTrueCopyPage() {
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
        jPanel3 = new javax.swing.JPanel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        jPanel2 = new javax.swing.JPanel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel4 = new javax.swing.JPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        jPanel5 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        xTextField5 = new com.rameses.rcp.control.XTextField();
        xTextField6 = new com.rameses.rcp.control.XTextField();
        xTextField7 = new com.rameses.rcp.control.XTextField();
        xTextField8 = new com.rameses.rcp.control.XTextField();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xActionTextField2 = new com.rameses.rcp.control.XActionTextField();
        jPanel6 = new javax.swing.JPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xDateField3 = new com.rameses.rcp.control.XDateField();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xTextField9 = new com.rameses.rcp.control.XTextField();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        xTextField10 = new com.rameses.rcp.control.XTextField();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xTextField11 = new com.rameses.rcp.control.XTextField();
        xLabel7 = new com.rameses.rcp.control.XLabel();
        xTextField12 = new com.rameses.rcp.control.XTextField();
        xLabel8 = new com.rameses.rcp.control.XLabel();
        xTextField13 = new com.rameses.rcp.control.XTextField();
        xLabel9 = new com.rameses.rcp.control.XLabel();
        xTextField14 = new com.rameses.rcp.control.XTextField();
        xLabel11 = new com.rameses.rcp.control.XLabel();
        xTextField15 = new com.rameses.rcp.control.XTextField();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        xLabel12 = new com.rameses.rcp.control.XLabel();
        xTextField16 = new com.rameses.rcp.control.XTextField();
        xLabel13 = new com.rameses.rcp.control.XLabel();
        xLabel14 = new com.rameses.rcp.control.XLabel();
        xNumberField4 = new com.rameses.rcp.control.XNumberField();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(748, 396));
        jSplitPane1.setDividerLocation(400);
        jPanel1.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Listing");
        jPanel1.setBorder(xTitledBorder1);
        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel3.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 1, 3, 5));
        xActionTextField1.setActionName("search");
        xActionTextField1.setCaptionMnemonic('h');
        xActionTextField1.setHint("Search");
        xActionTextField1.setIndex(-1);
        xActionTextField1.setName("searchText");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(200, 19));
        jPanel3.add(xActionTextField1, java.awt.BorderLayout.WEST);

        jPanel1.add(jPanel3, java.awt.BorderLayout.NORTH);

        xDataTable1.setHandler("listHandler");
        xDataTable1.setImmediate(true);
        xDataTable1.setName("selectedItem");
        jPanel1.add(xDataTable1, java.awt.BorderLayout.CENTER);

        jSplitPane1.setLeftComponent(jPanel1);

        jPanel2.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Document");
        jPanel2.setBorder(xTitledBorder2);
        xActionBar1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        xActionBar1.setDepends(new String[] {"selectedItem"});
        xActionBar1.setName("formActions");
        jPanel2.add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel4.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 5, 5));

        formPanel2.setCaptionWidth(70);
        xDateField1.setEditable(false);
        xDateField1.setCaption("Issue Date");
        xDateField1.setDepends(new String[] {"selectedItem"});
        xDateField1.setName("entity.issuedate");
        xDateField1.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel2.add(xDateField1);

        formPanel3.setCaptionWidth(70);
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        xLabel2.setCaption("Txn No");
        xLabel2.setDepends(new String[] {"selectedItem"});
        xLabel2.setFont(new java.awt.Font("Arial", 1, 12));
        xLabel2.setName("entity.txnno");
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel3.add(xLabel2);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Certified True Copy Information");
        jPanel5.setBorder(xTitledBorder3);

        formPanel1.setCaptionWidth(90);
        xTextField2.setCaption("Requested By");
        xTextField2.setDepends(new String[] {"selectedItem"});
        xTextField2.setName("entity.requestedby");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 18));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xTextField3.setCaption("Address");
        xTextField3.setDepends(new String[] {"selectedItem"});
        xTextField3.setName("entity.requestedbyaddress");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 18));
        xTextField3.setRequired(true);
        formPanel1.add(xTextField3);

        xTextField4.setCaption("Purpose");
        xTextField4.setDepends(new String[] {"selectedItem"});
        xTextField4.setName("entity.purpose");
        xTextField4.setPreferredSize(new java.awt.Dimension(0, 18));
        xTextField4.setRequired(true);
        formPanel1.add(xTextField4);

        xTextField5.setCaption("Authority of");
        xTextField5.setDepends(new String[] {"selectedItem"});
        xTextField5.setName("entity.authority");
        xTextField5.setPreferredSize(new java.awt.Dimension(0, 18));
        xTextField5.setRequired(true);
        formPanel1.add(xTextField5);

        xTextField6.setCaption("Cerified By");
        xTextField6.setDepends(new String[] {"selectedItem"});
        xTextField6.setName("entity.certifiedby");
        xTextField6.setPreferredSize(new java.awt.Dimension(0, 18));
        xTextField6.setRequired(true);
        formPanel1.add(xTextField6);

        xTextField7.setCaption("Title/Position");
        xTextField7.setDepends(new String[] {"selectedItem"});
        xTextField7.setName("entity.certifiedbytitle");
        xTextField7.setPreferredSize(new java.awt.Dimension(0, 18));
        xTextField7.setRequired(true);
        formPanel1.add(xTextField7);

        xTextField8.setCaption("OR No");
        xTextField8.setDepends(new String[] {"selectedItem"});
        xTextField8.setName("entity.orno");
        xTextField8.setPreferredSize(new java.awt.Dimension(150, 18));
        xTextField8.setRequired(true);
        formPanel1.add(xTextField8);

        xDateField2.setCaption("OR Date");
        xDateField2.setDepends(new String[] {"selectedItem"});
        xDateField2.setName("entity.ordate");
        xDateField2.setPreferredSize(new java.awt.Dimension(150, 18));
        xDateField2.setRequired(true);
        formPanel1.add(xDateField2);

        xNumberField1.setCaption("OR Amount");
        xNumberField1.setDepends(new String[] {"selectedItem"});
        xNumberField1.setFieldType(java.math.BigDecimal.class);
        xNumberField1.setName("entity.oramount");
        xNumberField1.setPattern("#,##0.00");
        xNumberField1.setPreferredSize(new java.awt.Dimension(150, 18));
        xNumberField1.setRequired(true);
        formPanel1.add(xNumberField1);

        xActionTextField2.setActionName("lookupFaas");
        xActionTextField2.setCaption("TD No.");
        xActionTextField2.setDepends(new String[] {"selectedItem"});
        xActionTextField2.setName("entity.tdno");
        xActionTextField2.setPreferredSize(new java.awt.Dimension(150, 18));
        xActionTextField2.setRequired(true);
        formPanel1.add(xActionTextField2);

        jPanel6.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder4 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder4.setTitle("FAAS Detail");
        jPanel6.setBorder(xTitledBorder4);
        xLabel1.setText("Issue Date :");
        jPanel6.add(xLabel1);
        xLabel1.setBounds(20, 30, 61, 16);

        xDateField3.setEditable(false);
        xDateField3.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xDateField3.setName("entity.faasinfo.issuedate");
        jPanel6.add(xDateField3);
        xDateField3.setBounds(100, 30, 100, 20);

        xLabel3.setText("Effectivity :");
        jPanel6.add(xLabel3);
        xLabel3.setBounds(250, 30, 58, 16);

        xTextField1.setEditable(false);
        xTextField1.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField1.setName("entity.faasinfo.effectivityyear");
        jPanel6.add(xTextField1);
        xTextField1.setBounds(310, 30, 60, 20);

        xLabel4.setText("-");
        jPanel6.add(xLabel4);
        xLabel4.setBounds(370, 30, 10, 16);

        xTextField9.setEditable(false);
        xTextField9.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField9.setName("entity.faasinfo.effectivityqtr");
        jPanel6.add(xTextField9);
        xTextField9.setBounds(380, 30, 60, 20);

        xLabel5.setText("Taxpayer :");
        jPanel6.add(xLabel5);
        xLabel5.setBounds(20, 50, 56, 16);

        xTextField10.setEditable(false);
        xTextField10.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField10.setName("entity.faasinfo.taxpayername");
        jPanel6.add(xTextField10);
        xTextField10.setBounds(100, 50, 340, 20);

        xLabel6.setExpression("Address :");
        jPanel6.add(xLabel6);
        xLabel6.setBounds(20, 70, 52, 16);

        xTextField11.setEditable(false);
        xTextField11.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField11.setName("entity.faasinfo.taxpayeraddress");
        jPanel6.add(xTextField11);
        xTextField11.setBounds(100, 70, 340, 20);

        xLabel7.setText("PIN :");
        jPanel6.add(xLabel7);
        xLabel7.setBounds(20, 90, 25, 16);

        xTextField12.setEditable(false);
        xTextField12.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField12.setName("entity.faasinfo.pin");
        jPanel6.add(xTextField12);
        xTextField12.setBounds(100, 90, 200, 20);

        xLabel8.setText("Classification :");
        jPanel6.add(xLabel8);
        xLabel8.setBounds(240, 110, 80, 16);

        xTextField13.setEditable(false);
        xTextField13.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField13.setName("entity.faasinfo.classcode");
        jPanel6.add(xTextField13);
        xTextField13.setBounds(350, 110, 90, 20);

        xLabel9.setExpression("Cadastral Lot :");
        jPanel6.add(xLabel9);
        xLabel9.setBounds(20, 110, 80, 16);

        xTextField14.setEditable(false);
        xTextField14.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField14.setName("entity.faasinfo.cadastrallotno");
        jPanel6.add(xTextField14);
        xTextField14.setBounds(100, 110, 130, 20);

        xLabel11.setText("Barangay :");
        jPanel6.add(xLabel11);
        xLabel11.setBounds(20, 130, 80, 16);

        xTextField15.setEditable(false);
        xTextField15.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField15.setName("entity.faasinfo.barangay");
        jPanel6.add(xTextField15);
        xTextField15.setBounds(100, 130, 130, 20);

        xNumberField3.setEditable(false);
        xNumberField3.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xNumberField3.setFieldType(java.math.BigDecimal.class);
        xNumberField3.setName("entity.faasinfo.mv");
        xNumberField3.setPattern("#,##0.00");
        jPanel6.add(xNumberField3);
        xNumberField3.setBounds(350, 130, 90, 20);

        xLabel12.setText("Market Value :");
        jPanel6.add(xLabel12);
        xLabel12.setBounds(240, 130, 110, 16);

        xTextField16.setEditable(false);
        xTextField16.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xTextField16.setName("entity.faasinfo.surveryno");
        jPanel6.add(xTextField16);
        xTextField16.setBounds(100, 150, 130, 20);

        xLabel13.setText("Survey No. :");
        jPanel6.add(xLabel13);
        xLabel13.setBounds(20, 150, 80, 16);

        xLabel14.setText("Assessed Value :");
        jPanel6.add(xLabel14);
        xLabel14.setBounds(240, 150, 110, 16);

        xNumberField4.setEditable(false);
        xNumberField4.setDepends(new String[] {"selectedItem", "entity.tdno"});
        xNumberField4.setFieldType(java.math.BigDecimal.class);
        xNumberField4.setName("entity.faasinfo.av");
        xNumberField4.setPattern("#,##0.00");
        jPanel6.add(xNumberField4);
        xNumberField4.setBounds(350, 150, 90, 20);

        org.jdesktop.layout.GroupLayout jPanel5Layout = new org.jdesktop.layout.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 414, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 414, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel5Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout jPanel4Layout = new org.jdesktop.layout.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel4Layout.createSequentialGroup()
                .add(formPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 217, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 217, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
            .add(jPanel5, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel4Layout.createSequentialGroup()
                .add(jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(formPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel5, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2.add(jPanel4, java.awt.BorderLayout.CENTER);

        jSplitPane1.setRightComponent(jPanel2);

        add(jSplitPane1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XActionTextField xActionTextField2;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XDateField xDateField3;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel11;
    private com.rameses.rcp.control.XLabel xLabel12;
    private com.rameses.rcp.control.XLabel xLabel13;
    private com.rameses.rcp.control.XLabel xLabel14;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XLabel xLabel7;
    private com.rameses.rcp.control.XLabel xLabel8;
    private com.rameses.rcp.control.XLabel xLabel9;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XNumberField xNumberField4;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField10;
    private com.rameses.rcp.control.XTextField xTextField11;
    private com.rameses.rcp.control.XTextField xTextField12;
    private com.rameses.rcp.control.XTextField xTextField13;
    private com.rameses.rcp.control.XTextField xTextField14;
    private com.rameses.rcp.control.XTextField xTextField15;
    private com.rameses.rcp.control.XTextField xTextField16;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    private com.rameses.rcp.control.XTextField xTextField5;
    private com.rameses.rcp.control.XTextField xTextField6;
    private com.rameses.rcp.control.XTextField xTextField7;
    private com.rameses.rcp.control.XTextField xTextField8;
    private com.rameses.rcp.control.XTextField xTextField9;
    // End of variables declaration//GEN-END:variables
    
}
