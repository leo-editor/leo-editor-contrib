#@+leo-ver=4-thin
#@+node:zorcanda!.20051007112951:@thin JTree2.py
import PositionJTree2

#import PositionJTree
class JTree2( PositionJTree2 ):
    
    def __init__( self, model ):
        #self.posTM = model
        #print dir( self )
        PositionJTree2.__init__( self, model )
        
    def getRootPosition( self ):
        return self.posTM.chapter.getRootPosition()
        
    def getPathToRoot( self, node ):
        return self.posTM.getPathToRoot( node )
        

if __name__ == "__main__":
    import javax.swing.tree as tree
    dmn = tree.DefaultMutableTreeNode( "x" )
    dnt = tree.DefaultTreeModel( dmn )
    jt = JTree2( dnt )

#@+at
# class JTree2( swing.JTree ):
#     def __init__( self, model ):
#         self.posTM = model
#         swing.JTree.__init__( self, model )
#         #tml2 = self.createTreeModelListener2()
#         #model.addTreeModelListener( tml2 )
#         #self.posTM = model
#     def hasBeenExpanded2( self, path ):
#         print "has Expanded?"
#         lc = path.getLastPathComponent()
#         if lc == self.posTM._root:
#             print lc
#             return False
#         else:
#             print lc, lc.isExpanded()
#             return not lc.isExpanded()
#         #print "hasExpanded"
#         #print path
#         return self.super__hasBeenExpanded( path )
# 
#     def isExpanded2( self, path ):
#         print "isExpanded"
#         print path
#         lc = path.getLastPathComponent()
#         if lc == self.posTM._root:
#             print lc
#             return False
#         else:
#             print lc, lc.isExpanded()
#             return not lc.isExpanded()
#         return self.super__isExpanded( path )
#         #lc = path.getLastPathComponent()
#         #if lc == self.posTM._root: return True
#         #else: return lc.isExpanded()
#     def removeDescendantToggledPaths2( self, data ):
#         pass
#     def isCollapsed2( self, data ):
#         print "COLLAPSED!"
#         return self.super__isCollapsed( data )
#     def getExpandedDescendants( self, path ):
#         #print "EXPANDING DESCENDEDNS!"
#         #print path
#         lc = path.getLastPathComponent()
#         paths = java.util.Vector()
#         #p_paths = {}
#         #if lc != self.posTM._root:
#         #    p_paths[ lc ] = path
#         if 1: #lc == self.posTM._root:
#             if lc == self.posTM._root:
#                 p = self.posTM.chapter.getRootPosition()
#                 cp = self.posTM.chapter.getCurrentPosition()
#             else:
#                 p = lc.copy()
#             #ends = java.util.HashSet()
#             ct = 0
#             #print "P is %s" % p
#             stop_p = p.copy()
#             while p:
#                 ct +=1
#                 #print p
#                 expanded = p.isExpanded()
#                 if expanded:
#                     #ends.add( p.copy() )
#                     #print _p
#                     #print p_paths
#                     #else:
#                     npath = self.posTM.getPathToRoot( p.copy() )
#                     #npath = p_path.pathByAddingChild( p.copy() 
# )#stree.TreePath( p_path, p.copy() )
#                     #p_paths[ p.copy() ] = npath
#                     paths.add( npath )
#                     #self.expandPath( npath )
#                     self.setExpandedState( npath, True )
#                     #print "two"
#                     #print npath.getPath()
#                 if expanded:
#                     if p.v.t._firstChild:
#                         p.moveToFirstChild()
#                     elif p and p.v._next:
#                         p.moveToNext()
#                     else:
#                         while p:
#                             p.moveToParent()
#                             if p == stop_p and not p.isRoot():
#                                 p = None
#                                 break
#                             if p and p.v._next:
#                                 p.moveToNext()
#                                 break
#                             elif not p: break
#                 else:
#                     if p.v._next:
#                         p.moveToNext()
#                     else:
#                         while p:
#                             p.moveToParent()
#                             if p == stop_p and not p.isRoot():
#                                 p = None
#                                 break
#                             if p and p.v._next:
#                                 p.moveToNext()
#                                 break
#                             elif not p: break
#         #print paths
#         return paths.elements()
#     def createTreeModelListener2( self ):
#         class st( sevent.TreeModelListener ):
#             def __init__( self, tree, posTM ):
#                 self.stree = tree
#                 self.posTM = posTM
#                 print "I AM A TREE LISTENER! %s" % tree
#                 print self.stree
#             def treeNodesChanged(TreeModelEvent, e): pass
#             def treeNodesInserted(TreeModelEvent, e): pass
#             def treeNodesRemoved( self , e): pass
#             def treeStructureChanged( self , e):
#                 try:
#                     print "ST STRUCTURE CHANGED!!!"
#                     #root = e.getTreePath()
#                     #if not root: return
#                     p = self.posTM.chapter.getRootPosition()
#                     cp = self.posTM.chapter.getCurrentPosition()
#                     ends = java.util.HashSet()
#                     ct = 0
#                     while p:
#                         ct +=1
#                         #print p
#                         expanded = p.isExpanded()
#                         if expanded:
#                             ends.add( p.copy() )
#                         if expanded:
#                             if p.v.t._firstChild:
#                                 p.moveToFirstChild()
#                             elif p and p.v._next:
#                                 p.moveToNext()
#                             else:
#                                 while p:
#                                     p.moveToParent()
#                                     if p and p.v._next:
#                                         p.moveToNext()
#                                         break
#                                     elif not p: break
#                         else:
#                             if p.v._next:
#                                 p.moveToNext()
#                             else:
#                                 while p:
#                                     p.moveToParent()
#                                     if p and p.v._next:
#                                         p.moveToNext()
#                                         break
#                                     elif not p: break
# 
#                     print "TOTAL ITERATIONS WERE %s" % ct
#                     print ends
#                     #def zoo():
#                     haveseen = {}
#                     for z in ends:
#                         path = self.posTM.getPathToRoot( z )
#                         #data = path.get
#                         #print path
#                         #print "EXPAND %s" % path
#                         self.stree.fireTreeExpanded( path )
#                     spath = self.posTM.getPathToRoot( cp )
#                     self.stree.setSelectionPath( spath )
#                     self.stree.scrollPathToVisible( spath )
#                 except java.lang.Exception, x:
#                     print x
#                     print "STRUCTURE EXCEPTION!"
#         return st( self, self.posTM )
#     #def isVisible( self, data ):
#     #    print "VISIBLE"
#     #    return self.super__isVisible( data )
#@-at
#@nonl
#@-node:zorcanda!.20051007112951:@thin JTree2.py
#@-leo
