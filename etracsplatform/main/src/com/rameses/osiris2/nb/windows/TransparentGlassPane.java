/*
 * TransparentGlassPane.java
 *
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import javax.swing.JPanel;


public class TransparentGlassPane extends JPanel {
    
    private float opacity = 0.5f;
    private Color background;
    
    public TransparentGlassPane(float opacity, Color background) {
        this.opacity = opacity;
        this.background = background;
    }
    
    public void paint(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, opacity));
        g2d.setColor(background);
        
        Rectangle rec = getBounds();
        g2d.fillRect(rec.x, rec.y, rec.width-1, rec.height-1);
    }
    
}
