//@+leo-ver=4-thin
//@+node:orkman.20050216144756:@thin leoTreeReloader.java
//@@language java
import javax.swing.*;
import javax.swing.tree.*;
import javax.swing.event.*;
import java.util.List; 
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.Enumeration;
import java.util.Comparator;
import java.util.Arrays;

public final class leoTreeReloader implements Runnable{

    private final JTree _jtree;
    private final TreeModel _model;
    private final List< TreeModelListener > _listeners; 
    private Enumeration<TreePath> _snapshot;
    private TreePath _current;
    private Set _paths;
    private final TreeExpansionTracker _tet;
    private final PositionComparator _pc;
    private final Object _rootNode;
    private final Map<PositionSpecification, Object> _haveseen;
    
    
    public leoTreeReloader( final JTree jtree, List< TreeModelListener > listeners, Object rootNode ){
    
        _jtree = jtree;
        _tet = new TreeExpansionTracker();
        _jtree.addTreeExpansionListener( _tet );
        _model = jtree.getModel();
        _listeners = listeners;
        _pc = new PositionComparator();
        _rootNode = rootNode;
        _haveseen = new HashMap< PositionSpecification, Object >();

    
    }



    private final void createTreeNodes( final PositionSpecification[] in, final Set<TreePath> out ){    
 
        _haveseen.clear();
        for( final PositionSpecification node: in ){

            if( _haveseen.containsKey( node ) ) continue;
            if( node.isExpanded() == false ){ //we check for this here since positions can lie if there are no children in it, 
                                             //and we fix our state
            
                _tet._expanded.remove( node );
                continue;
            
            }
            Object[] a = getObjectArrayToBuildTreePath( node.level(), _rootNode, node.copy() );
            int i = a.length - 2;
            final Iterator< PositionSpecification > pi = node.getParentIterator();
            while( pi.hasNext() ){
                final PositionSpecification parent = pi.next();
                
                if( !parent.isExpanded() ){
                
                    a = null;
                    break;
                
                
                }
                _haveseen.put( parent, null );
                a[ i ] = parent.copy();
                i--;

            }
            if( a != null ) out.add( new TreePath( a ) );
        
        
        }
        /*haveseen = {} # java.util.HashMap()
        for node in data:
            if haveseen.has_key( node ): # in haveseen:
                continue
            a = leoTreeReloader.getObjectArrayToBuildTreePath( node.level(), self._root, node.copy() );
            i = len( a ) - 2
            for z in node.parents_iter( copy = True):
                if not z.isExpanded():
                    a = None
                    break
                haveseen[ z ] =  None 
                a[ i ] = z
                i = i - 1
                
            if a != None:
                out.add( stree.TreePath( a ) )
        return out*/
        
        }
    
    public final static Object[] getObjectArrayToBuildTreePath( final int level, final Object root, final Object end ){
    
        
        final Object[] oa =  new Object[ level + 2 ];
        oa[ 0 ] = root;
        oa[ oa.length -1 ] = end;
        return oa; 
    
    }
    
    private final class PositionComparator implements Comparator< PositionSpecification >{
    
    
        public final int compare( final PositionSpecification a, final PositionSpecification b ){
        
            final int a1 = a.level();
            final int b1 = b.level();
            if( a1 == b1 ) return 0;
            else if( a1 < b1 ) return 1;
            else return -1;        
        
        }
    
    
    }



    
    public final void setCurrentPosition( final TreePath tp ){
    
        //if( !_enabled ) return;
        _current = tp;
    
    }
    
    public final void executeChange(){
    
        final Object root = _model.getRoot();
        final TreeModelEvent tme = new TreeModelEvent( root, new TreePath( root ) );
        for( final TreeModelListener tml: _listeners ){
        
            tml.treeStructureChanged( tme );
        
        
        }    
    
    }
    

    
    public final void run(){

        final Object root = _model.getRoot();
        final TreeModelEvent tme = new TreeModelEvent( root, new TreePath( root ) );
        for( final TreeModelListener tml: _listeners ){
        
            tml.treeStructureChanged( tme );
        
        
        }  
        
        
        final Set< TreePath> paths = new java.util.HashSet<TreePath>();
        final PositionSpecification[] pi =  _tet._expanded.toArray( new PositionSpecification[ _tet._expanded.size() ]  );
        Arrays.sort( pi, _pc );

        createTreeNodes( pi, paths );
        //_cptr.calculatePathToRoot( pi , paths );
        for( final TreePath tp: paths ){
            try{
                _jtree.expandPath( tp );
            }
            catch( Exception x ){
            
                }
    
        }


       if( _current != null ){
       
            _jtree.setSelectionPath( _current );
            _jtree.scrollPathToVisible( _current );
            
            }
        
    
    }

    public void expand( final PositionSpecification pos ){
    
        final TreePath tp = new TreePath( pos );
        final TreeExpansionEvent tee = new TreeExpansionEvent( this, tp );
        _tet.treeExpanded( tee );
    
    }
    
    public void collapse( final PositionSpecification pos ){
        
        if( _tet._expanded.contains( pos ) )
            _tet._expanded.remove( pos );
    
    }
    
    public void addExpandedSet( Set<PositionSpecification> positions ){
    
        _tet._expanded.addAll( positions );
    
    }
    
    private final class TreeExpansionTracker implements TreeExpansionListener{
    
    
        final Set<PositionSpecification> _expanded;
    
        public TreeExpansionTracker(){
        
            _expanded = new HashSet<PositionSpecification>(); //new HashSet();
        
        
        }
    
        public void treeCollapsed( final TreeExpansionEvent tee ){
        
            final TreePath tp = tee.getPath();
            Object x = tp.getLastPathComponent();
            if( x instanceof PositionSpecification ){
            final PositionSpecification o = (PositionSpecification)x; //tp.getLastPathComponent();
            //if( _expanded.contains( o ) ) return;
            //synchronized( _expanded )
            o.contract();
            _expanded.remove( o );
            }
        
        }
        
        public void treeExpanded( final TreeExpansionEvent tee ){
        
            final TreePath tp = tee.getPath();
            Object x = tp.getLastPathComponent();
            if( x instanceof PositionSpecification ){
            final PositionSpecification o = (PositionSpecification)x;//tp.getLastPathComponent();
            //if( _expanded.contains( o ) ) _expanded.remove( o );
            //synchronized( _expanded )
            o.expand();
            _expanded.add( o );
            }
        
        
        }
    
    
    
    
    }


}
//@nonl
//@-node:orkman.20050216144756:@thin leoTreeReloader.java
//@-leo
