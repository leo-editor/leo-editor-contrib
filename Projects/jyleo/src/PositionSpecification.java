//@+leo-ver=4-thin
//@+node:orkman.20050217124828:@thin PositionSpecification.java
//@@language java
import java.util.Iterator;
import java.awt.Color;
import java.awt.Font;
import javax.swing.ImageIcon;
//import org.python.core.*;

public interface PositionSpecification{ 

        //------drawn from Position
        public int level();
        public PositionSpecification getParent();
        public PositionSpecification copy();
        public boolean isCurrentPosition();
        public void expand();
        public void contract();
        public boolean isAtIgnoreNode();
        public boolean isExpanded();
        public boolean isVisited();
        public boolean isDirty();
        public int childIndex();
        public void setVisited();
        public boolean isRoot();
        public String headString();
        public String bodyString();
        public TnodeBodyText getTnodeBodyText();
        public void clearAllVisitedInTree(); //# Clear both vnode and tnode bits.
        public void clearVisitedInTree();
        public boolean setDirty(); ///this one will teach you to ignore whats returned ! :D
        public void clearDirty();
        public void setOrphan();
        public void clearOrphan();
        public boolean isOrphan();
        public String atFileNodeName();
        public String atNoSentFileNodeName();
        public String atThinFileNodeName();
        public String anyAtFileNodeName();
        public boolean equal( PositionSpecification p );
        public Object getT();
        public PositionSpecification moveToThreadNext();
        public PositionSpecification moveToNodeAfterTree();
        public PositionSpecification nodeAfterTree();
        
        public boolean isAtNorefFileNode();
        public boolean isAtAsisFileNode();
        public boolean isAnyAtFileNode();
        public boolean isAtNoSentFileNode();
        public boolean isAtThinFileNode();
        public boolean isAtFileNode();
        
        //------added to Position
        public Iterator<PositionSpecification> getParentIterator();
        public Iterator<PositionSpecification> getChildrenIterator();
        public Iterator<PositionSpecification> getSelfAndSubtreeIterator();
        public Iterator<PositionSpecification> getSelfAndParentsIterator();
        public void setWriteBit();
        public void setTVisited();
        public Object[] getTFileIndex();
        public Object acquireV();
        public int computeIconFromV();
        public void clearTTnodeList();
        public void g_es( String data );
        public boolean isValid();
        public Object get_T();
        public Object get_V();
        public Object get_Stack();
        //---- added to Colorize headlines
        public void setForeground( Color c );
        public void setBackground( Color c );
        public Color getBackground();
        public Color getForeground();
        public void setStrikeThrough( boolean torf );
        public boolean getStrikeThrough();
        public void setUnderline( boolean torf );
        public boolean getUnderline();
        public void setItalic( boolean torf );
        public boolean getItalic();
        public void setBold( boolean torf );
        public boolean getBold();
        public void setFont( Font f );
        public Font getFont();
        public void setImage( byte[] data );
        public ImageIcon getImage();
        public void setIcon( byte[] data );
        public ImageIcon getIcon();
        public boolean tnodeHasUA( String name );
        
        public PositionSpecification moveToParent();
        public PositionSpecification moveToFirstChild();
        public PositionSpecification moveToNext();
        public boolean hasNext();
        public boolean hasFirstChild();
        public boolean equals( Object o );
        
}


//@-node:orkman.20050217124828:@thin PositionSpecification.java
//@-leo
