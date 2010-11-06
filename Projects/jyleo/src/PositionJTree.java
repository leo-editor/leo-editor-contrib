//@+leo-ver=4-thin
//@+node:zorcanda!.20051007100531:@thin PositionJTree.java
//@@language java
import java.util.*;
import javax.swing.*;
import javax.swing.tree.*;

public abstract class PositionJTree extends JTree{


    public PositionJTree( TreeModel tm ){
    
        super( tm );
    
    
    }
    
    public TreePath getPathToRoot( Object o ){ return null; }
    public abstract PositionSpecification getRootPosition();//{ return null; }
    public void clearToggledPaths(){ super.clearToggledPaths(); }

    public Enumeration<TreePath> getExpandedDescendants( final TreePath path ){
    
        Object o = path.getLastPathComponent();
        PositionSpecification p;
        if( o instanceof PositionSpecification )
            p = ((PositionSpecification)o).copy();
        else
            p = getRootPosition();
            
        final Vector<TreePath> paths = new Vector();
        PositionSpecification stop_p = p.copy();
        while( p != null && p.isValid() ){
        
            final boolean expanded = p.isExpanded();
            if( expanded ){
            
                final TreePath npath = getPathToRoot( p.copy() );
                paths.add( npath );
                //setExpandedState( npath, true );
            
            
            
            }
        
        
            if( expanded ){
                if( p.hasFirstChild() ) p.moveToFirstChild();
                else if( p.isValid() && p.hasNext() ) p.moveToNext();
                else{
                
                    while( p != null && p.isValid() ){
                    
                        p.moveToParent();
                        if( p.equals( stop_p ) &&  !p.isRoot() ){
                        
                            p = null; break;
                        
                        
                        }
                        else if( p.isValid() && p.hasNext() ){
                        
                            p.moveToNext(); break;
                        
                        
                        }
                        else if ( !p.isValid() ) break;
                    
                    }
                
                    
                    }
                
                }
                else{
                
                    if( p.hasNext() ) p.moveToNext();
                    else{
                    
                        while( p != null && p.isValid() ){
                        
                            p.moveToParent();
                            if( p.equals( stop_p ) &&  !p.isRoot() ){
                        
                                p = null; break;
                        
                        
                            }
                            if( p.isValid() && p.hasNext() ){
                            
                                p.moveToNext(); break;
                            
                            }
                            else if( !p.isValid() ) break;
                        
                        
                        }                    
                    
                    }                
                
                }
            }
        class PRunner implements Runnable{
        
            public void run(){
            
                for( final TreePath tp: paths )
                    PositionJTree.this.setExpandedState( tp, true );
            
            
            }
        
        
        }
        
        SwingUtilities.invokeLater( new PRunner() );
        System.out.println( paths.hashCode() );
        return paths.elements();
        }
    }

//@+at
//     def getExpandedDescendants( self, path ):
//         #print "EXPANDING DESCENDEDNS!"
//         #print path
//         lc = path.getLastPathComponent()
//         paths = java.util.Vector()
//         #p_paths = {}
//         #if lc != self.posTM._root:
//         #    p_paths[ lc ] = path
//         if 1: #lc == self.posTM._root:
//             if lc == self.posTM._root:
//                 p = self.posTM.chapter.getRootPosition()
//                 cp = self.posTM.chapter.getCurrentPosition()
//             else:
//                 p = lc.copy()
//             #ends = java.util.HashSet()
//             ct = 0
//             #print "P is %s" % p
//             stop_p = p.copy()
//             while p:
//                 ct +=1
//                 #print p
//                 expanded = p.isExpanded()
//                 if expanded:
//                     #ends.add( p.copy() )
//                     #print _p
//                     #print p_paths
//                     #else:
//                     npath = self.posTM.getPathToRoot( p.copy() )
//                     #npath = p_path.pathByAddingChild( p.copy() 
// )#stree.TreePath( p_path, p.copy() )
//                     #p_paths[ p.copy() ] = npath
//                     paths.add( npath )
//                     #self.expandPath( npath )
//                     self.setExpandedState( npath, True )
//                     #print "two"
//                     #print npath.getPath()
//                 if expanded:
//                     if p.v.t._firstChild:
//                         p.moveToFirstChild()
//                     elif p and p.v._next:
//                         p.moveToNext()
//                     else:
//                         while p:
//                             p.moveToParent()
//                             if p == stop_p and not p.isRoot():
//                                 p = None
//                                 break
//                             if p and p.v._next:
//                                 p.moveToNext()
//                                 break
//                             elif not p: break
//                 else:
//                     if p.v._next:
//                         p.moveToNext()
//                     else:
//                         while p:
//                             p.moveToParent()
//                             if p == stop_p and not p.isRoot():
//                                 p = None
//                                 break
//                             if p and p.v._next:
//                                 p.moveToNext()
//                                 break
//                             elif not p: break
//         #print paths
//         return paths.elements()
// 
// 
// 
// 
// 
//@-at
//@-node:zorcanda!.20051007100531:@thin PositionJTree.java
//@-leo
