/*
 * RPTCompromiseInitPage.java
 *
 * Created on August 5, 2012, 10:44 AM
 */

package etracs2.rpt.compromise;

/**
 *
 * @author  PRMF
 */
public class RPTCompromiseInitPage extends javax.swing.JPanel {
    
    /** Creates new form RPTCompromiseInitPage */
    public RPTCompromiseInitPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();

        setLayout(new java.awt.BorderLayout());

        xActionBar1.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel1.setLayout(new java.awt.BorderLayout());

        jLabel1.setBackground(new java.awt.Color(0, 0, 102));
        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText(" Compromise Agreement");
        jLabel1.setOpaque(true);
        jLabel1.setPreferredSize(new java.awt.Dimension(172, 25));
        jPanel1.add(jLabel1, java.awt.BorderLayout.NORTH);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Initial Information");
        formPanel1.setBorder(xTitledBorder1);
        xLookupField1.setCaption("TD No.");
        xLookupField1.setCaptionWidth(120);
        xLookupField1.setExpression("#{tdno}");
        xLookupField1.setHandler("lookupLedger");
        xLookupField1.setName("ledger");
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xLookupField1.setRequired(true);
        formPanel1.add(xLookupField1);

        xNumberField1.setCaption("Term (Months)");
        xNumberField1.setCaptionWidth(120);
        xNumberField1.setFieldType(Integer.class);
        xNumberField1.setName("entity.info.term");
        xNumberField1.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField1.setRequired(true);
        formPanel1.add(xNumberField1);

        xNumberField2.setCaption("No. of Installments");
        xNumberField2.setCaptionWidth(120);
        xNumberField2.setName("entity.info.numofinstallment");
        xNumberField2.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField2.setRequired(true);
        formPanel1.add(xNumberField2);

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 424, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(108, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 185, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(57, Short.MAX_VALUE))
        );
        jPanel1.add(jPanel2, java.awt.BorderLayout.CENTER);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    // End of variables declaration//GEN-END:variables
    
}
