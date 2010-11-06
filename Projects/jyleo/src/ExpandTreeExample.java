import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.tree.*;
import java.util.*;

public class ExpandTreeExample extends JTree{

    public boolean use_normal_expansion_methods;
    static Vector<TreePath> tps = new Vector<TreePath>();

    public ExpandTreeExample( TreeModel tm ){
    
        super( tm );
        use_normal_expansion_methods = false;
    }


    public void setUseNormalExpansionMethods( boolean use ){
    
        use_normal_expansion_methods = use;
    
    
    }

    //These 2 methods seem to only return information that is tracked internally, 
    //they don't affect whether a tree node is expanded or not on reload,
    //but they affect whether or not a node is expanded when clicked on.
    @Override
    public boolean isExpanded( TreePath tp ){
    
        //if( use_normal_expansion_methods )
            return super.isExpanded( tp );
    
        //System.out.println( "isExpanded " + tp );
        //uncomment to see how they expand the tree but also give a nasty flicker/flash when doing so
        //setExpandedState( tp, true );
        
        //In my application it would be nifty if I could query the data passed in and see if it was expanded.
        //This I can do, but it doesn't do what I expect if I just return the 'true' or 'false'.
        //return true; //just returning true all the time seems to interfere with Mouse click expansion/collapse
    
    }

    @Override
    public boolean hasBeenExpanded( TreePath tp ){ 
        
        //if( use_normal_expansion_methods )
        return super.hasBeenExpanded( tp );
        //System.out.println( "hasBeenExpanded " + tp );
        //uncomment to see how they expand the tree but also give a nasty flicker/flash when doing so
        //setExpandedState( tp, true );
        //return true; //just returning true all the time seems to interfere with Mouse click expansion/collapse
    
    }


    @Override
    public Enumeration< TreePath > getExpandedDescendants( TreePath tp ){
        
        //java.lang.Thread.currentThread().dumpStack();
        System.out.println( tp );
        return tps.elements();
        //return super.getExpandedDescendants( tp );
    
    
    }
    /* Since the previous 2 methods, don't quite do what I want I have to have a component that imposes the expanded state
       after each reload.  Ideally for my app, it would be great to not have to impose it.  Maybe a simple scheme where the
       model could implement a "NodeExpansionModel" that has a method:
       public boolean pathExpanded( TreePath tp )  --> this return true if the path is expanded, false otherwise
       or/and
       public boolean nodeExpanded( Object node ) --> this returns true if the node identified by 'node' is expanded or not.
       
       then the JTree could just query the "NodeExpansionModel" when reloaded to determine which nodes are expanded or not.
       For my app this would be great in that the nodes contain information about their expansion state:
       p.isExpanded() #--> p is a Position in my app, it is the front end class for the 'node'
       
       when the JTree is reloaded, I currently have to iterate over my structure and then build a TreePath for each expanded node.
       This TreePath, in turn is passed to 'fireTreeExpanded' of the JTree instance.
       
       My simple thesis, again, is that it would be a nice improvement if the JTree did the work of deciding if a node is expanded
       or not, via querying some model.  Maybe the method to add the model would be:
       setNodeExpansionModel( NodeExpansionModel model )
       if the NodeExpansionModel isn't set, then you could just use the current behavior when reloading--> which is not to
       expand anything */
       
       
    
    
    public static void main( String[] args ){
    
        JFrame jf = new JFrame();
        jf.getContentPane().setLayout( new BorderLayout() );
        final DefaultMutableTreeNode dmtn = new DefaultMutableTreeNode( "Using Overrides" );
        for( int i = 0; i < 5; i++ ){
            DefaultMutableTreeNode dmtn2 = new DefaultMutableTreeNode( i );
            dmtn.add( dmtn2 );
            for( int i2 = 0; i2 < 5; i2++ ){
             DefaultMutableTreeNode dmtn3 = new DefaultMutableTreeNode( i + "" + i2 );  
             dmtn2.add( dmtn3 );
             DefaultMutableTreeNode[] path = new DefaultMutableTreeNode[]{ dmtn, dmtn2, dmtn3 };
             tps.add( new TreePath( path ) );
             
             }
        
        }
        
        final DefaultTreeModel dtm = new DefaultTreeModel( dmtn );
        final ExpandTreeExample jt = new ExpandTreeExample( dtm );
        JScrollPane jsp = new JScrollPane( jt );
        jf.add( jsp );
        JButton jb = new JButton( new AbstractAction( "Reload" ){
        
        
            public void actionPerformed( ActionEvent ae ){
                
                System.out.println( "PRE RELOAD" );
                dtm.reload();
                TreePath tp = new TreePath( dmtn );
                //jt.fireTreeExpanded( tp );
                //jt.firePropertyChange( jt.TREE_MODEL_PROPERTY, dtm, dtm );
                //jt.expandPath( tp );
                //jt.setModel( null );
                //jt.setModel( dtm );
                //jt.updateUI();
                System.out.println( "POST RELOAD" );
            
            }
        
        
        
        });
        jb.setToolTipText( "Press Me To Reload The TreeModel" );
        JButton jb2 = new JButton( new AbstractAction( "Toggle Normal Expansion Methods" ){
        
            public void actionPerformed( ActionEvent ae ){
            
                if( jt.use_normal_expansion_methods ){
                    dmtn.setUserObject( "Using Overrides" );
                    System.out.println( "Setting Overrides to False" );
                    jt.setUseNormalExpansionMethods( false );
                }
                else{
                    
                    dmtn.setUserObject( "Not Using Overrides" );
                    System.out.println( "Setting Use Normal Methods" );
                    jt.setUseNormalExpansionMethods( true );
                    
                }
            dtm.reload();
            
            
            }
        
        
        
        });
        jb2.setToolTipText( "Press Me to Toggle Back to Normal JTree Expansion Methods" );
        JPanel jp = new JPanel();
        jp.add( jb );
        jp.add( jb2 );
        jf.add( jp, BorderLayout.SOUTH );
        jf.pack();
        jf.setVisible( true );
    
    
    
    
    
    }


}