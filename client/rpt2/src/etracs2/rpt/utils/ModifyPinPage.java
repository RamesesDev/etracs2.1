/*
 * ChangePinPage.java
 *
 * Created on August 6, 2012, 9:40 PM
 */

package etracs2.rpt.utils;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  PRMF
 */
@StyleSheet
public class ModifyPinPage extends javax.swing.JPanel {
    
    /** Creates new form ChangePinPage */
    public ModifyPinPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xComboBox4 = new com.rameses.rcp.control.XComboBox();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xButton1 = new com.rameses.rcp.control.XButton();
        xButton2 = new com.rameses.rcp.control.XButton();
        xSeparator1 = new com.rameses.rcp.control.XSeparator();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Existing PIN Information");
        formPanel1.setBorder(xTitledBorder1);
        formPanel1.setCaptionWidth(105);
        xLookupField1.setCaption("TD No.");
        xLookupField1.setExpression("#{tdno}");
        xLookupField1.setHandler("lookupFaas");
        xLookupField1.setIndex(-100);
        xLookupField1.setName("faas");
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLookupField1);

        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Taxpayer Name");
        xLabel1.setDepends(new String[] {"faas"});
        xLabel1.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel1.setName("faas.taxpayername");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel1);

        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("Cadastral Lot No.");
        xLabel2.setDepends(new String[] {"faas"});
        xLabel2.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel2.setName("faas.cadastrallotno");
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel2);

        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setCaption("PIN");
        xLabel3.setDepends(new String[] {"faas"});
        xLabel3.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel3.setName("faas.fullpin");
        xLabel3.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel3);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Modified PIN Information");
        formPanel2.setBorder(xTitledBorder2);
        formPanel2.setCaptionWidth(105);
        xComboBox3.setAllowNull(false);
        xComboBox3.setCaption("PIN Type");
        xComboBox3.setImmediate(true);
        xComboBox3.setItems("pinTypeList");
        xComboBox3.setName("pintype");
        xComboBox3.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox3.setRequired(true);
        formPanel2.add(xComboBox3);

        xComboBox1.setCaption("Municipality/City");
        xComboBox1.setDepends(new String[] {"faas"});
        xComboBox1.setDoubleBuffered(true);
        xComboBox1.setDynamic(true);
        xComboBox1.setExpression("#{lguname}");
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("municityList");
        xComboBox1.setName("municity");
        xComboBox1.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox1.setRequired(true);
        formPanel2.add(xComboBox1);

        xComboBox4.setCaption("District");
        xComboBox4.setDepends(new String[] {"municity"});
        xComboBox4.setDoubleBuffered(true);
        xComboBox4.setDynamic(true);
        xComboBox4.setExpression("#{lguname}");
        xComboBox4.setImmediate(true);
        xComboBox4.setItems("districtList");
        xComboBox4.setName("district");
        xComboBox4.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox4.setRequired(true);
        formPanel2.add(xComboBox4);

        xComboBox2.setCaption("Barangay");
        xComboBox2.setDepends(new String[] {"municity", "district"});
        xComboBox2.setDynamic(true);
        xComboBox2.setExpression("#{lguname}");
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("barangayList");
        xComboBox2.setName("barangay");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox2.setRequired(true);
        formPanel2.add(xComboBox2);

        xNumberField1.setCaption("Section");
        xNumberField1.setFieldType(Integer.class);
        xNumberField1.setName("section");
        xNumberField1.setPreferredSize(new java.awt.Dimension(80, 19));
        xNumberField1.setRequired(true);
        formPanel2.add(xNumberField1);

        xNumberField2.setCaption("Parcel");
        xNumberField2.setFieldType(Integer.class);
        xNumberField2.setName("parcel");
        xNumberField2.setPreferredSize(new java.awt.Dimension(80, 19));
        xNumberField2.setRequired(true);
        formPanel2.add(xNumberField2);

        xNumberField3.setCaption("Suffix");
        xNumberField3.setDepends(new String[] {"faas"});
        xNumberField3.setFieldType(Integer.class);
        xNumberField3.setName("suffix");
        xNumberField3.setPreferredSize(new java.awt.Dimension(80, 19));
        xNumberField3.setRequired(true);
        formPanel2.add(xNumberField3);

        xCheckBox1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox1.setText(" Use old Index No.?");
        xCheckBox1.setCaption("");
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox1.setName("useoldpin");
        formPanel2.add(xCheckBox1);

        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        xLabel4.setCaption("New PIN");
        xLabel4.setCellPadding(new java.awt.Insets(10, 0, 0, 0));
        xLabel4.setFont(new java.awt.Font("Arial", 1, 18));
        xLabel4.setName("newpin");
        xLabel4.setPreferredSize(new java.awt.Dimension(0, 26));
        xLabel4.setShowCaption(false);
        formPanel2.add(xLabel4);

        xButton1.setMnemonic('c');
        xButton1.setText("Cancel");
        xButton1.setImmediate(true);
        xButton1.setName("_close");

        xButton2.setMnemonic('u');
        xButton2.setText("Update");
        xButton2.setName("updatePin");

        org.jdesktop.layout.GroupLayout xSeparator1Layout = new org.jdesktop.layout.GroupLayout(xSeparator1);
        xSeparator1.setLayout(xSeparator1Layout);
        xSeparator1Layout.setHorizontalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 411, Short.MAX_VALUE)
        );
        xSeparator1Layout.setVerticalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 20, Short.MAX_VALUE)
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                        .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .add(layout.createSequentialGroup()
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                            .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 391, Short.MAX_VALUE))
                        .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
            .add(org.jdesktop.layout.GroupLayout.TRAILING, xSeparator1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 411, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 124, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 262, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 19, Short.MAX_VALUE)
                .add(xSeparator1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XComboBox xComboBox4;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XSeparator xSeparator1;
    // End of variables declaration//GEN-END:variables
    
}
