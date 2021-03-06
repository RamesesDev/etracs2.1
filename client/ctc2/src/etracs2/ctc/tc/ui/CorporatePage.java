package etracs2.ctc.tc.ui;

import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author  jaycverg
 */
@Template(ReceiptContentPage.class)
@StyleSheet
public class CorporatePage extends javax.swing.JPanel {
    
    /** Creates new form IndividualPage */
    public CorporatePage() {
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
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField5 = new com.rameses.rcp.control.XTextField();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        xCheckBox2 = new com.rameses.rcp.control.XCheckBox();
        xTextField11 = new com.rameses.rcp.control.XTextField();
        jPanel2 = new javax.swing.JPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        xButton1 = new com.rameses.rcp.control.XButton();
        jPanel3 = new javax.swing.JPanel();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        xNumberField4 = new com.rameses.rcp.control.XNumberField();
        xNumberField6 = new com.rameses.rcp.control.XNumberField();
        xNumberField7 = new com.rameses.rcp.control.XNumberField();
        xNumberField8 = new com.rameses.rcp.control.XNumberField();
        xButton2 = new com.rameses.rcp.control.XButton();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Taxpayer Information");
        jPanel1.setBorder(xTitledBorder1);

        formPanel1.setCaptionWidth(120);
        xDateField2.setCaption("Txn. Date");
        xDateField2.setCaptionWidth(70);
        xDateField2.setCellPadding(new java.awt.Insets(0, 0, 10, 0));
        xDateField2.setFont(new java.awt.Font("Arial", 1, 11));
        xDateField2.setName("entity.info.txndate");
        xDateField2.setPreferredSize(new java.awt.Dimension(100, 19));
        xDateField2.setReadonly(true);
        formPanel1.add(xDateField2);

        xTextField2.setCaption("Company");
        xTextField2.setCaptionWidth(70);
        xTextField2.setName("entity.info.payer.entityname");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xTextField5.setCaption("Address");
        xTextField5.setCaptionWidth(70);
        xTextField5.setCellPadding(new java.awt.Insets(0, 0, 20, 0));
        xTextField5.setName("entity.info.payer.entityaddress");
        xTextField5.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField5.setRequired(true);
        formPanel1.add(xTextField5);

        xTextField1.setCaption("TIN");
        xTextField1.setName("entity.info.payer.info.tin");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xTextField1);

        xComboBox2.setCaption("Kind of Organization");
        xComboBox2.setItems("entitySvc.organizationTypes");
        xComboBox2.setName("entity.info.payer.info.orgtype");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xComboBox2);

        xTextField3.setCaption("Nature of Business");
        xTextField3.setCellPadding(new java.awt.Insets(0, 0, 10, 0));
        xTextField3.setName("entity.info.payer.info.nature");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xTextField3);

        xDateField1.setCaption("Date Registered");
        xDateField1.setName("entity.info.payer.info.dtregistered");
        xDateField1.setPreferredSize(new java.awt.Dimension(100, 19));
        formPanel1.add(xDateField1);

        xTextField4.setCaption("Place of Registration");
        xTextField4.setName("entity.info.payer.info.placeregistered");
        xTextField4.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xTextField4);

        xCheckBox2.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox2.setCaption("Is Additional?");
        xCheckBox2.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox2.setName("entity.additional");
        formPanel1.add(xCheckBox2);

        xTextField11.setCaption("Remarks");
        xTextField11.setDepends(new String[] {"entity.additional"});
        xTextField11.setName("entity.additional_remarks");
        xTextField11.setPreferredSize(new java.awt.Dimension(165, 19));
        formPanel1.add(xTextField11);

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 384, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 270, Short.MAX_VALUE)
                .addContainerGap())
        );

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Salary / Business Gross / RPT Income");
        jPanel2.setBorder(xTitledBorder2);

        formPanel2.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel2.setCaptionOrientation(com.rameses.rcp.constant.UIConstants.TOP);
        xNumberField1.setCaption("Assessed Value of Property");
        xNumberField1.setFieldType(java.math.BigDecimal.class);
        xNumberField1.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField1.setName("entity.realpropertyav");
        xNumberField1.setPattern("#,##0.00");
        xNumberField1.setPreferredSize(new java.awt.Dimension(300, 19));
        formPanel2.add(xNumberField1);

        xNumberField2.setCaption("Business Gross (Preceeding Year)");
        xNumberField2.setFieldType(java.math.BigDecimal.class);
        xNumberField2.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField2.setName("entity.businessgross");
        xNumberField2.setPattern("#,##0.00");
        xNumberField2.setPreferredSize(new java.awt.Dimension(300, 19));
        formPanel2.add(xNumberField2);

        xButton1.setMnemonic('t');
        xButton1.setText("Calculate Tax");
        xButton1.setImmediate(true);
        xButton1.setName("calculate");

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 281, Short.MAX_VALUE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 133, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 32, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Community Tax Breakdown");
        jPanel3.setBorder(xTitledBorder3);

        formPanel3.setCaptionWidth(120);
        xNumberField4.setCaption("Basic Tax");
        xNumberField4.setFieldType(java.math.BigDecimal.class);
        xNumberField4.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField4.setName("entity.tax.basic");
        xNumberField4.setPattern("#,##0.00");
        xNumberField4.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel3.add(xNumberField4);

        xNumberField6.setCaption("Property Tax");
        xNumberField6.setFieldType(java.math.BigDecimal.class);
        xNumberField6.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField6.setName("entity.tax.property");
        xNumberField6.setPattern("#,##0.00");
        xNumberField6.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel3.add(xNumberField6);

        xNumberField7.setCaption("Gross Receipt Tax");
        xNumberField7.setFieldType(java.math.BigDecimal.class);
        xNumberField7.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField7.setName("entity.tax.business");
        xNumberField7.setPattern("#,##0.00");
        xNumberField7.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel3.add(xNumberField7);

        xNumberField8.setCaption("Interest");
        xNumberField8.setFieldType(java.math.BigDecimal.class);
        xNumberField8.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField8.setName("entity.tax.interest");
        xNumberField8.setPattern("#,##0.00");
        xNumberField8.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel3.add(xNumberField8);

        xButton2.setMnemonic('d');
        xButton2.setText("Accept Tax Due");
        xButton2.setImmediate(true);
        xButton2.setName("acceptTaxDue");

        org.jdesktop.layout.GroupLayout jPanel3Layout = new org.jdesktop.layout.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 281, Short.MAX_VALUE)
                    .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 133, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel3Layout.createSequentialGroup()
                .add(formPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 32, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(jPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(46, 46, 46))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(layout.createSequentialGroup()
                        .add(jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(132, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XCheckBox xCheckBox2;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    private com.rameses.rcp.control.XNumberField xNumberField4;
    private com.rameses.rcp.control.XNumberField xNumberField6;
    private com.rameses.rcp.control.XNumberField xNumberField7;
    private com.rameses.rcp.control.XNumberField xNumberField8;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField11;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    private com.rameses.rcp.control.XTextField xTextField5;
    // End of variables declaration//GEN-END:variables
    
}
