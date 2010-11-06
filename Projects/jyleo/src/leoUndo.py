#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3603:@thin leoUndo.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80

# Undo manager for leo.py.  

#@<< How Leo implements unlimited undo >>
#@+node:ekr.20031218072017.2413:<< How Leo implements unlimited undo >>
#@+at 
#@nonl
# Only leo.py supports unlimited undo.  Unlimited undo is straightforward; it 
# merely requires that all commands that affect the outline or body text must 
# be undoable. In other words, everything that affects the outline or body 
# text must be remembered.
# 
# We may think of all the actions that may be Undone or Redone as a string of 
# beads (undo nodes). Undoing an operation moves backwards to the next bead; 
# redoing an operation moves forwards to the next bead. A bead pointer points 
# to the present bead. The bead pointer points in front of the first bead when 
# Undo is disabled.  The bead pointer points at the last bead when Redo is 
# disabled. An undo node is a Python dictionary containing all information 
# needed to undo or redo the operation.
# 
# The Undo command uses the present bead to undo the action, then moves the 
# bead pointer backwards. The Redo command uses the bead after the present 
# bead to redo the action, then moves the bead pointer forwards. All undoable 
# operations call setUndoParams() to create a new bead. The list of beads does 
# not branch; all undoable operations (except the Undo and Redo commands 
# themselves) delete any beads following the newly created bead.
# 
# I did not invent this model of unlimited undo.  I first came across it in 
# the documentation for Apple's Yellow Box classes.
#@-at
#@-node:ekr.20031218072017.2413:<< How Leo implements unlimited undo >>
#@nl

import leoGlobals as g
import string

#@+others
#@+node:ekr.20031218072017.3605:class undoer
class baseUndoer:
    """The base class of the undoer class."""
    #@    @+others
    #@+node:ekr.20031218072017.3606:undo.__init__ & clearIvars
    def __init__ (self,c):
        
        u = self ; u.c = c
        # Ivars to transition to new undo scheme...
        u.debug = False # True: enable debugging code in new undo scheme.
        u.debug_print = False # True: enable print statements in debug code.
        u.new_undo = True # True: enable new debug code.
    
        # Statistics comparing old and new ways (only if u.debug is on).
        u.new_mem = 0
        u.old_mem = 0
    
        # State ivars...
        u.undoType = "Can't Undo"
        # These must be set here, _not_ in clearUndoState.
        u.redoMenuLabel = "Can't Redo"
        u.undoMenuLabel = "Can't Undo"
        u.realRedoMenuLabel = "Can't Redo"
        u.realUndoMenuLabel = "Can't Undo"
        u.undoing = False # True if executing an Undo command.
        u.redoing = False # True if executing a Redo command.
        
        # New in 4.2...
        #@    << Define optional ivars >>
        #@+node:ekr.20031218072017.3604:<< Define optional ivars >>
        # New in 4.2: this is now an ivar, not a global, and it's a list, not a tuple.
        
        u.optionalIvars = [
            "lastChild",
            "parent","oldParent",
            "back","oldBack",
            "n","oldN","oldV",
            "oldText","newText",
            "oldSel","newSel",
            "sort","select",
            "oldTree","newTree", # Added newTree 10/14/03
            "yview",
            # For incremental undo typing...
            "leading","trailing",
            "oldMiddleLines","newMiddleLines",
            "oldNewlines","newNewlines" ]
        #@nonl
        #@-node:ekr.20031218072017.3604:<< Define optional ivars >>
        #@nl
        #@    << define redoDispatchDict >>
        #@+node:EKR.20040526072519:<< define redoDispatchDict >>
        u.redoDispatchDict = {
            "Change":             u.redoTyping,
            "Change All":         u.redoChangeAll,
            "Change Headline":    u.redoChangeHeadline,
            'Clear Recent Files': u.redoTyping,
            "Clone Node":         u.redoClone,
            "Convert All Blanks": u.redoReplaceNodesContents,
            "Convert All Tabs":   u.redoReplaceNodesContents,
            "Convert Blanks":     u.redoTyping,
            "Convert Tabs":       u.redoTyping,
            "Cut":                u.redoTyping,
            "Cut Node":           u.redoDeleteNode,
            "De-Hoist":           u.redoDehoist,
            "Delete":             u.redoTyping,
            "Delete Node":        u.redoDeleteNode,
            "Demote":             u.redoDemote,
            "Drag":               u.redoMoveNode,
            "Drag & Clone":       u.redoClone,
            "Extract":            u.redoReplaceNodes,
            "Extract Names":      u.redoReplaceNodes,
            "Extract Section":    u.redoReplaceNodes,
            "Hoist":              u.redoHoist,
            "Import":             u.redoInsertNodes,
            "Indent":             u.redoTyping,
            "Insert Node":        u.redoInsertNodes,
            "Move Down":          u.redoMoveNode,
            "Move Left":          u.redoMoveNode,
            "Move Right":         u.redoMoveNode,
            "Move Up":            u.redoMoveNode,
            "Paste":              u.redoTyping,
            "Paste Node":         u.redoInsertNodes,
            "Pretty Print":       u.redoChangeAll,
            "Promote":            u.redoPromote,
            "Read @file Nodes":   u.redoReplaceNodes,
            "Reformat Paragraph": u.redoTyping,
            "Sort Children":      u.redoSortChildren,
            "Sort Siblings":      u.redoSortSiblings,
            "Sort Top Level":     u.redoSortTopLevel,
            "Typing":             u.redoTyping,
            "Undent":             u.redoTyping }
        #@nonl
        #@-node:EKR.20040526072519:<< define redoDispatchDict >>
        #@nl
        #@    << define undoDispatchDict >>
        #@+node:EKR.20040526075238:<< define undoDispatchDict >>
        u.undoDispatchDict = {
            "Change":             u.undoTyping,
            "Change All":         u.undoChangeAll,
            "Change Headline":    u.undoChangeHeadline,
            'Clear Recent Files': u.undoTyping,
            "Clone Node":         u.undoClone,
            "Convert All Blanks": u.undoReplaceNodesContents,
            "Convert All Tabs":   u.undoReplaceNodesContents,
            "Convert Blanks":     u.undoTyping,
            "Convert Tabs":       u.undoTyping,
            "Cut":                u.undoTyping,
            "Cut Node":           u.undoDeleteNode,
            "De-Hoist":           u.undoDehoist,
            "Delete":             u.undoTyping,
            "Delete Node":        u.undoDeleteNode,
            "Demote":             u.undoDemote,
            "Drag":               u.undoMoveNode,
            "Drag & Clone":       u.undoDragClone, # redo uses redoClone.
            "Extract":            u.undoReplaceNodes,
            "Extract Names":      u.undoReplaceNodes,
            "Extract Section":    u.undoReplaceNodes,
            "Hoist":              u.undoHoist,
            "Import":             u.undoInsertNodes,
            "Indent":             u.undoTyping,
            "Insert Node":        u.undoInsertNodes,
            "Move Down":          u.undoMoveNode,
            "Move Left":          u.undoMoveNode,
            "Move Right":         u.undoMoveNode,
            "Move Up":            u.undoMoveNode,
            "Paste":              u.undoTyping,
            "Paste Node":         u.undoInsertNodes,
            "Pretty Print":       u.undoChangeAll,
            "Promote":            u.undoPromote,
            "Read @file Nodes":   u.undoReplaceNodes,
            "Reformat Paragraph": u.undoTyping,
            "Sort Children":      u.undoSortChildren,
            "Sort Siblings":      u.undoSortSiblings,
            "Sort Top Level":     u.undoSortTopLevel,
            "Typing":             u.undoTyping,
            "Undent":             u.undoTyping }
        #@nonl
        #@-node:EKR.20040526075238:<< define undoDispatchDict >>
        #@nl
        
    
        u.updateSetChangedFlag = True
        u.redrawFlag = True
        
    #@+node:ekr.20031218072017.3607:clearIvars
    def clearIvars (self):
        
        u = self
        
        u.p = None # The position/node being operated upon for undo and redo.
        for ivar in u.optionalIvars:
            setattr(u,ivar,None)
    #@nonl
    #@-node:ekr.20031218072017.3607:clearIvars
    #@-node:ekr.20031218072017.3606:undo.__init__ & clearIvars
    #@+node:EKR.20040526094429:registerUndoHandlers & registerHandler
    def registerUndoHandlers (self,undoName,undoFunc,redoFunc,verbose=False):
        
        """Public method to set undo & redo handlers for a new command."""
        
        u = self
        u.registerHandler(undoName,redoFunc,"Redo",u.redoDispatchDict,verbose)
        u.registerHandler(undoName,undoFunc,"Undo",u.undoDispatchDict,verbose)
        
        
    def registerHandler (self,undoName,func,kind,dict,verbose=False):
        
        """Private helper method for registerUndoHandlers."""
        
        u = self
    
        try:
            g.funcToMethod(func,undoer)
            assert(hasattr(u,func.__name__))
        except (AttributeError, AssertionError):
            s = "Bad %s handler for %s: %s" % (kind,undoName,repr(func))
            g.trace(s) ; g.es(s, color="red")
            return
        try:
            dict[undoName] = getattr(u,func.__name__) # Get the method, not the function.
            if verbose:
                print "%s registered as %s handler for %s" % (func.__name__,kind,undoName)
        except KeyError:
            s = "Bad key: %s for %s: %s" % (kind,undoName,repr(func))
            g.trace(s) ; g.es(s, color="red")
    #@nonl
    #@-node:EKR.20040526094429:registerUndoHandlers & registerHandler
    #@+node:ekr.20031218072017.3608:State routines...
    #@+node:ekr.20031218072017.3609:clearUndoState
    def clearUndoState (self):
    
        """Clears then entire Undo state.
        
        All non-undoable commands should call this method."""
        u = self
        u.setRedoType("Can't Redo")
        u.setUndoType("Can't Undo")
        u.beads = [] # List of undo nodes.
        u.bead = -1 # Index of the present bead: -1:len(beads)
        u.clearIvars()
    
    #@-node:ekr.20031218072017.3609:clearUndoState
    #@+node:ekr.20031218072017.3610:canRedo & canUndo
    # Translation does not affect these routines.
    
    def canRedo (self):
    
        u = self
        return u.redoMenuLabel != "Can't Redo"
    
    def canUndo (self):
    
        u = self
        return u.undoMenuLabel != "Can't Undo"
    #@-node:ekr.20031218072017.3610:canRedo & canUndo
    #@+node:ekr.20031218072017.3611:enableMenuItems
    def enableMenuItems (self):
    
        u = self ; frame = u.c.frame
        menu = frame.menu.getMenu("Edit")
        frame.menu.enableMenu(menu,u.redoMenuLabel,u.canRedo())
        frame.menu.enableMenu(menu,u.undoMenuLabel,u.canUndo())
    #@-node:ekr.20031218072017.3611:enableMenuItems
    #@+node:ekr.20031218072017.3612:getBead, peekBead, setBead
    #@+node:EKR.20040526150818:getBeed
    def getBead (self,n):
        
        u = self
        if n < 0 or n >= len(u.beads):
            return None
        d = u.beads[n]
        # g.trace(n,len(u.beads),d)
        self.clearIvars()
        u.p = d["v"]
        u.undoType = d["undoType"]
    
        for ivar in u.optionalIvars:
            val = d.get(ivar,None)
            setattr(u,ivar,val)
    
        if not u.new_undo: # Recreate an "oldText" entry if necessary.
            if u.undoType == "Typing" and u.oldText == None:
                assert(n > 0)
                old_d = u.beads[n-1]
                # The user will lose data if these asserts fail.
                assert(old_d["undoType"] == "Typing")
                assert(old_d["v"] == u.p)
                u.oldText = old_d["newText"]
                # g.trace(u.oldText)
        return d
    #@nonl
    #@-node:EKR.20040526150818:getBeed
    #@+node:EKR.20040526150818.1:peekBeed
    def peekBead (self,n):
        
        u = self
        if n < 0 or n >= len(u.beads):
            return None
        d = u.beads[n]
        # g.trace(n,len(u.beads),d)
        return d
    #@nonl
    #@-node:EKR.20040526150818.1:peekBeed
    #@+node:EKR.20040526150818.2:setBeed
    def setBead (self,n,keywords=None):
    
        u = self ; d = {}
        d["undoType"]=u.undoType
        d["v"]=u.p
        # Only enter significant entries into the dictionary.
        # This is an important space optimization for typing.
        for ivar in u.optionalIvars:
            if getattr(u,ivar) != None:
                d[ivar] = getattr(u,ivar)
        # copy all significant keywords to d.
        if keywords:
            for key in keywords.keys():
                if keywords[key] != None:
                    d[key] = keywords[key]
        # Clear the "oldText" entry if the previous entry was a "Typing" entry.
        # This optimization halves the space needed for Undo/Redo Typing.
        if not u.new_undo:
            if u.undoType == "Typing" and n > 0:
                old_d = u.beads[n-1]
                if old_d["undoType"] == "Typing" and old_d["v"] == u.p:
                    del d["oldText"] # We can recreate this entry from old_d["newText"]
                    # g.trace(u.oldText)
        # g.trace(d)
        return d
    #@nonl
    #@-node:EKR.20040526150818.2:setBeed
    #@-node:ekr.20031218072017.3612:getBead, peekBead, setBead
    #@+node:ekr.20031218072017.3613:redoMenuName, undoMenuName
    def redoMenuName (self,name):
    
        if name=="Can't Redo":
            return name
        else:
            return "Redo " + name
    
    def undoMenuName (self,name):
    
        if name=="Can't Undo":
            return name
        else:
            return "Undo " + name
    #@nonl
    #@-node:ekr.20031218072017.3613:redoMenuName, undoMenuName
    #@+node:ekr.20031218072017.3614:setRedoType, setUndoType
    # These routines update both the ivar and the menu label.
    def setRedoType (self,theType):
    
        u = self ; frame = u.c.frame
        menu = frame.menu.getMenu("Edit")
        name = u.redoMenuName(theType)
        if name != u.redoMenuLabel:
            # Update menu using old name.
            realLabel = frame.menu.getRealMenuName(name)
            if realLabel == name:
                underline=g.choose(g.match(name,0,"Can't"),-1,0)
            else:
                underline = realLabel.find("&")
            realLabel = realLabel.replace("&","")
            frame.menu.setMenuLabel(menu,u.realRedoMenuLabel,realLabel,underline=underline)
            u.redoMenuLabel = name
            u.realRedoMenuLabel = realLabel
    
    def setUndoType (self,theType):
        u = self ; frame = u.c.frame
        menu = frame.menu.getMenu("Edit")
        name = u.undoMenuName(theType)
        if name != u.undoMenuLabel:
            # Update menu using old name.
            realLabel = frame.menu.getRealMenuName(name)
            if realLabel == name:
                underline=g.choose(g.match(name,0,"Can't"),-1,0)
            else:
                underline = realLabel.find("&")
            realLabel = realLabel.replace("&","")
            frame.menu.setMenuLabel(menu,u.realUndoMenuLabel,realLabel,underline=underline)
            u.undoType = theType
            u.undoMenuLabel = name
            u.realUndoMenuLabel = realLabel
    #@nonl
    #@-node:ekr.20031218072017.3614:setRedoType, setUndoType
    #@+node:ekr.20031218072017.3616:setUndoTypes
    def setUndoTypes (self):
        
        u = self
        # g.trace(u.bead,len(u.beads))
    
        # Set the undo type and undo menu label.
        d = u.peekBead(u.bead)
        if d:
            u.setUndoType(d["undoType"])
        else:
            u.setUndoType("Can't Undo")
    
        # Set only the redo menu label.
        d = u.peekBead(u.bead+1)
        if d:
            u.setRedoType(d["undoType"])
        else:
            u.setRedoType("Can't Redo")
    #@nonl
    #@-node:ekr.20031218072017.3616:setUndoTypes
    #@-node:ekr.20031218072017.3608:State routines...
    #@+node:EKR.20040606195417:Top-level entries
    #@+node:ekr.20031218072017.3615:setUndoParams
    #@+at 
    #@nonl
    # This routine saves enough information so an operation can be undone and 
    # redone.  We do nothing when called from the undo/redo logic because the 
    # Undo and Redo commands merely reset the bead pointer.
    #@-at
    #@@c
    
    def setUndoParams (self,undo_type,p,**keywords):
        
        # g.trace(undo_type,p,keywords)
        #return #Jython Change: undo doesnt work yet
        u = self
        if u.redoing or u.undoing: return None
        if undo_type == None:
            return None
        if undo_type == "Can't Undo":
            u.clearUndoState()
            return None
    
        # Set the type: set the menu labels later.
        u.undoType = undo_type
        # Calculate the standard derived information.
        u.p = p.copy()
        u.parent = p.parent().copy()
        
        u.back = p.back()
        u.n = p.childIndex()
        # Push params on undo stack, clearing all forward entries.
        u.bead += 1
        d = u.setBead(u.bead,keywords)
        u.beads[u.bead:] = [d]
        # g.trace(len(u.beads),u.bead,keywords)
        # Recalculate the menu labels.
        u.setUndoTypes()
        return d
    #@-node:ekr.20031218072017.3615:setUndoParams
    #@+node:ekr.20031218072017.1490:setUndoTypingParams
    #@+at 
    #@nonl
    # This routine saves enough information so a typing operation can be 
    # undone and redone.
    # 
    # We do nothing when called from the undo/redo logic because the Undo and 
    # Redo commands merely reset the bead pointer.
    #@-at
    #@@c
    
    def setUndoTypingParams (self,p,undo_type,oldText,newText,oldSel,newSel,oldYview=None, undoobject = None):
        
        # g.trace(undo_type,p,"old:",oldText,"new:",newText)
        u = self ; c = u.c
        #@    << return if there is nothing to do >>
        #@+node:ekr.20040324061854:<< return if there is nothing to do >>
        if u.redoing or u.undoing:
            return None
        
        if undo_type == None:
            return None
        
        if undo_type == "Can't Undo":
            u.clearUndoState()
            return None
        
        if oldText == newText:
            # g.trace("no change")
            return None
        #@nonl
        #@-node:ekr.20040324061854:<< return if there is nothing to do >>
        #@nl
        #@    << init the undo params >>
        #@+node:ekr.20040324061854.1:<< init the undo params >>
        # Clear all optional params.
        for ivar in u.optionalIvars:
            setattr(u,ivar,None)
        
        # Set the params.
        u.undoType = undo_type
        u.p = p
        #@nonl
        #@-node:ekr.20040324061854.1:<< init the undo params >>
        #@nl
        #@    << compute leading, middle & trailing  lines >>
        #@+node:ekr.20031218072017.1491:<< compute leading, middle & trailing  lines >>
        #@+at 
        #@nonl
        # Incremental undo typing is similar to incremental syntax coloring.  
        # We compute the number of leading and trailing lines that match, and 
        # save both the old and new middle lines.
        # 
        # NB: the number of old and new middle lines may be different.
        #@-at
        #@@c
        
        #@+at
        # if undo_type == "undo_edit_class:
        #     pass
        # else:
        #     old_lines = string.split(oldText,'\n')
        #     new_lines = string.split(newText,'\n')
        #     new_len = len(new_lines)
        #     old_len = len(old_lines)
        #     min_len = min(old_len,new_len)
        # 
        #     i = 0
        #     while i < min_len:
        #         if old_lines[i] != new_lines[i]:
        #             break
        #         i += 1
        #     leading = i
        # 
        #     if leading == new_len:
        #         # This happens when we remove lines from the end.
        #         # The new text is simply the leading lines from the old 
        # text.
        #     t   railing = 0
        #     else:
        #         i = 0
        #         while i < min_len - leading:
        #             if old_lines[old_len-i-1] != new_lines[new_len-i-1]:
        #                 break
        #             i += 1
        #         trailing = i
        #     # NB: the number of old and new middle lines may be different.
        #     if trailing == 0:
        #         old_middle_lines = old_lines[leading:]
        #         new_middle_lines = new_lines[leading:]
        #     else:
        #         old_middle_lines = old_lines[leading:-trailing]
        #         new_middle_lines = new_lines[leading:-trailing]
        #     # Remember how many trailing newlines in the old and new text.
        #     i = len(oldText) - 1 ; old_newlines = 0
        #     while i >= 0 and oldText[i] == '\n':
        #         old_newlines += 1
        #         i -= 1
        # 
        # i = len(newText) - 1 ; new_newlines = 0
        # while i >= 0 and newText[i] == '\n':
        #     new_newlines += 1
        #     i -= 1
        # 
        # if u.debug_print:
        #     g.trace()
        #     print "lead,trail",leading,trailing
        #     print "old mid,nls:",len(old_middle_lines),old_newlines,oldText
        #     print "new mid,nls:",len(new_middle_lines),new_newlines,newText
        #     #print "lead,trail:",leading,trailing
        #     #print "old mid:",old_middle_lines
        #     #print "new mid:",new_middle_lines
        #     print "---------------------"
        #@-at
        #@nonl
        #@-node:ekr.20031218072017.1491:<< compute leading, middle & trailing  lines >>
        #@nl
        #@    << save undo text info >>
        #@+node:ekr.20031218072017.1492:<< save undo text info >>
        #@+at 
        #@nonl
        # This is the start of the incremental undo algorithm.
        # 
        # We must save enough info to do _both_ of the following:
        # 
        # Undo: Given newText, recreate oldText.
        # Redo: Given oldText, recreate oldText.
        # 
        # The "given" texts for the undo and redo routines are simply 
        # v.bodyString().
        #@-at
        #@@c
        
        if u.new_undo:
            if u.debug:
                # Remember the complete text for comparisons...
                u.oldText = oldText
                u.newText = newText
                # Compute statistics comparing old and new ways...
                # The old doesn't often store the old text, so don't count it here.
                u.old_mem += len(newText)
                s1 = string.join(old_middle_lines,'\n')
                s2 = string.join(new_middle_lines,'\n')
                u.new_mem += len(s1) + len(s2)
            else:
                u.oldText = None
                u.newText = None
        #else:
        #    u.oldText = oldText
        #    u.newText = newText
        
        #@+at
        # self.leading = leading
        # self.trailing = trailing
        # self.oldMiddleLines = old_middle_lines
        # self.newMiddleLines = new_middle_lines
        # self.oldNewlines = old_newlines
        # self.newNewlines = new_newlines
        #@-at
        #@nonl
        #@-node:ekr.20031218072017.1492:<< save undo text info >>
        #@nl
        #@    << save the selection and scrolling position >>
        #@+node:ekr.20040324061854.2:<< save the selection and scrolling position >>
        #Remember the selection.
        u.oldSel = oldSel
        u.newSel = newSel
        
        # Remember the scrolling position.
        if oldYview:
            u.yview = oldYview
        else:
            u.yview = c.frame.body.getYScrollPosition()
        #@-node:ekr.20040324061854.2:<< save the selection and scrolling position >>
        #@nl
        #@    << adjust the undo stack, clearing all forward entries >>
        #@+node:ekr.20040324061854.3:<< adjust the undo stack, clearing all forward entries >>
        # Push params on undo stack, clearing all forward entries.
        if undo_type == 'undo_edit_class':
            u.bead += 1
            u.beads[ u.bead: ] = undoobject
        else:
            u.bead += 1
            d = u.setBead(u.bead)
            u.beads[u.bead:] = [d]
        
        # g.trace(len(u.beads), u.bead)
        #@nonl
        #@-node:ekr.20040324061854.3:<< adjust the undo stack, clearing all forward entries >>
        #@nl
        u.setUndoTypes() # Recalculate the menu labels.
        return d
    #@nonl
    #@-node:ekr.20031218072017.1490:setUndoTypingParams
    #@+node:EKR.20040528075307:u.saveTree
    def saveTree (self,p,treeInfo=None):
        
        """Create all info needed to handle a general undo operation."""
    
        # WARNING: read this before doing anything "clever"
        #@    << about u.saveTree >>
        #@+node:EKR.20040530114124:<< about u.saveTree >>
        #@+at 
        # The old code made a free-standing copy of the tree using v.copy and 
        # t.copy.  This looks "elegant" and is WRONG.  The problem is that it 
        # can not handle clones properly, especially when some clones were in 
        # the "undo" tree and some were not.   Moreover, it required complex 
        # adjustments to t.vnodeLists.
        # 
        # Instead of creating new nodes, the new code creates all information 
        # needed to properly restore the vnodes and tnodes.  It creates a list 
        # of tuples, on tuple for each vnode in the tree.  Each tuple has the 
        # form,
        # 
        # (vnodeInfo, tnodeInfo) where vnodeInfo and tnodeInfo are dicts 
        # contain all info needed to recreate the nodes.  The 
        # v.createUndoInfoDict and t.createUndoInfoDict methods correspond to 
        # the old v.copy and t.copy methods.
        # 
        # Aside:  Prior to 4.2 Leo used a scheme that was equivalent to the 
        # createUndoInfoDict info, but quite a bit uglier.
        #@-at
        #@-node:EKR.20040530114124:<< about u.saveTree >>
        #@nl
        
        u = self ; topLevel = (treeInfo == None)
        if topLevel: treeInfo = []
    
        # Add info for p.v and p.v.t.  Duplicate tnode info is harmless.
        data = (p.v,p.v.createUndoInfo(),p.v.t.createUndoInfo())
        treeInfo.append(data)
    
        # Recursively add info for the subtree.
        child = p.firstChild()
        while child:
            self.saveTree(child,treeInfo)
            child = child.next()
    
        # if topLevel: g.trace(treeInfo)
        return treeInfo
    #@-node:EKR.20040528075307:u.saveTree
    #@+node:EKR.20040530121329:u.restoreTree
    def restoreTree (self,treeInfo):
        
        """Use the tree info to restore all vnode and tnode data,
        including all links."""
        
        # This effectively relinks all vnodes.
        
        for v,vInfo,tInfo in treeInfo:
            v.restoreUndoInfo(vInfo)
            v.t.restoreUndoInfo(tInfo)
    #@nonl
    #@-node:EKR.20040530121329:u.restoreTree
    #@+node:EKR.20040606195417.1:u.saveNode
    def saveNode (self,p):
        
        """Create all info for a single vnode."""
        
        u = self
    
        treeInfo = (p.v,p.v.createUndoInfo(),p.v.t.createUndoInfo())
        return treeInfo
    #@nonl
    #@-node:EKR.20040606195417.1:u.saveNode
    #@+node:EKR.20040606195417.2:u.saveNodeAndChildren
    def saveNodeAndChildren (self,p):
        
        """Create all info needed for a node and all its immediate children."""
    
        u = self
        treeInfo = []
    
        # Add info for p.v and p.v.t.  Duplicate tnode info is harmless.
        data = (p.v,p.v.createUndoInfo(),p.v.t.createUndoInfo())
        treeInfo.append(data)
    
        # Add info for all children.
        child = p.firstChild()
        while child:
            data = (child.v,child.v.createUndoInfo(),child.v.t.createUndoInfo())
            treeInfo.append(data)
            child = child.next()
    
        return treeInfo
    
    #@-node:EKR.20040606195417.2:u.saveNodeAndChildren
    #@+node:EKR.20040606195417.3:u.saveListOfNodes
    def saveListOfNodes (self,listOfVnodes):
        
        """Create all info for a list of vnodes."""
        
        u = self ; treeInfo = []
    
        for v in listOfVnodes:
            data = (v,v.createUndoInfo(),v.t.createUndoInfo())
            treeInfo.append(data)
    
        return treeInfo
    #@nonl
    #@-node:EKR.20040606195417.3:u.saveListOfNodes
    #@-node:EKR.20040606195417:Top-level entries
    #@+node:ekr.20031218072017.2030:redo & allies
    def redo (self):
    
        u = self ; c = u.c
        if not u.canRedo(): return
        if not u.getBead(u.bead+1): return
        if not  c.currentPosition(): return
        # g.trace(u.bead+1,len(u.beads),u.peekBead(u.bead+1))
    
        u.redoing = True 
        u.redrawFlag = True
        u.updateSetChangedFlag = True
        
        c.beginUpdate()
        if 1: # update...
            try:
                func = u.redoDispatchDict[u.undoType]
            except KeyError:
                s = "Unknown redo key: %s" % u.undoType
                g.trace(s) ; g.es(s, color="red")
                func = None
            if func:
                func()
                if u.updateSetChangedFlag:
                    c.setChanged(True)
                    if u.p: u.p.setDirty(setDescendentsDirty=False)
        c.endUpdate(u.redrawFlag)
    
        u.redoing = False
        u.bead += 1
        u.setUndoTypes()
    #@nonl
    #@+node:EKR.20040526090701.1:redoChangeAll
    def redoChangeAll (self):
        
        u = self ; c = u.c
    
        count = 0
        while 1:
            u.bead += 1
            d = u.getBead(u.bead+1)
            assert(d)
            # g.trace(u.undoType,u.p,u.newText)
            if u.undoType in ("Change All","Pretty Print"):
                c.selectVnode(u.p)
                break
            elif u.undoType == "Change":
                u.p.v.setTnodeText(u.newText)
                u.p.setDirty()
                count += 1
            elif u.undoType == "Change Headline":
                u.p.initHeadString(u.newText)
                count += 1
            else: assert(False)
    
        g.es("redo %d instances" % count)
    #@nonl
    #@-node:EKR.20040526090701.1:redoChangeAll
    #@+node:EKR.20040526090701.2:redoChangeHeadline
    def redoChangeHeadline (self):
        
        u = self ; c = u.c
        
        # g.trace(u.newText)
        
        u.p.setHeadStringOrHeadline(u.newText)
        
        c.selectVnode(u.p)
    #@nonl
    #@-node:EKR.20040526090701.2:redoChangeHeadline
    #@+node:EKR.20040526072519.1:redoClone
    def redoClone (self):
        
        u = self ; c = u.c
        
        if u.back:
            u.p.linkAfter(u.back)
        elif u.parent:
            u.p.linkAsNthChild(u.parent,0)
        else:
            oldRoot = c.rootPosition()
            u.p.linkAsRoot(oldRoot)
    
        c.selectVnode(u.p)
    #@nonl
    #@-node:EKR.20040526072519.1:redoClone
    #@+node:EKR.20040526072519.2:redoDeleteNode
    def redoDeleteNode (self):
        
        u = self ; c = u.c
    
        c.selectVnode(u.p)
        c.deleteOutline()
    #@nonl
    #@-node:EKR.20040526072519.2:redoDeleteNode
    #@+node:EKR.20040526072519.3:redoHoist & redoDehoist
    def redoHoist (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.hoist()
        u.updateSetChangedFlag = False
        
    def redoDehoist (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.dehoist()
        u.updateSetChangedFlag = False
    #@nonl
    #@-node:EKR.20040526072519.3:redoHoist & redoDehoist
    #@+node:EKR.20040526072519.4:redoInsertNodes
    def redoInsertNodes (self):
        
        u = self ; c = u.c
    
        if u.back:
            u.p.linkAfter(u.back)
        elif u.parent:
            u.p.linkAsNthChild(u.parent,0)
        else:
            oldRoot = c.rootPosition()
            u.p.linkAsRoot(oldRoot)
            
        # Restore all vnodeLists (and thus all clone marks).
        u.p.restoreLinksInTree()
    
        c.selectVnode(u.p)
    #@nonl
    #@-node:EKR.20040526072519.4:redoInsertNodes
    #@+node:EKR.20040526075238.1:redoMoveNode
    def redoMoveNode (self):
        
        u = self ; c = u.c
    
        # g.trace(u.p)
        if u.parent:
            u.p.moveToNthChildOf(u.parent,u.n)
        elif u.back:
            u.p.moveAfter(u.back)
        else:
            oldRoot = c.rootPosition() # Bug fix: 4/9/04
            u.p.moveToRoot(oldRoot)
    
        c.selectVnode(u.p)
    #@nonl
    #@-node:EKR.20040526075238.1:redoMoveNode
    #@+node:EKR.20040526075238.2:redoDemote & redoPromote
    def redoDemote (self):
        
        u = self ; c = u.c
    
        c.selectVnode(u.p)
        c.demote()
        
    def redoPromote (self):
        
        u = self ; c = u.c
    
        c.selectVnode(u.p)
        c.promote()
    #@nonl
    #@-node:EKR.20040526075238.2:redoDemote & redoPromote
    #@+node:EKR.20040526075238.3:redoReplaceNodes & replaceNodesContents
    def redoReplaceNodes (self):
        
        """Redo replacement of multiple nodes."""
        
        u = self ; c = u.c
    
        u.p = self.undoReplace(u.p,u.oldTree,u.newTree)
        c.selectVnode(u.p) # Does full recolor.
        if u.newSel:
            c.frame.body.setTextSelection(u.newSel)
            
    def redoReplaceNodesContents (self):
        
        """Redo replacement of body text of multiple nodes."""
        
        u = self
        u.redoReplaceNodes()
        u.redrawFlag = False
    #@-node:EKR.20040526075238.3:redoReplaceNodes & replaceNodesContents
    #@+node:EKR.20040526075238.4:redoSortChildren/Siblings/TopLevel
    def redoSortChildren (self):
        
        u = self ; c = u.c
    
        c.selectVnode(u.p)
        c.sortChildren()
    
    def redoSortSiblings (self):
        
        u = self ; c = u.c
    
        c.selectVnode(u.p)
        c.sortSiblings()
        
    def redoSortTopLevel (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.sortTopLevel()
        u.p = None # don't mark u.p dirty
    #@nonl
    #@-node:EKR.20040526075238.4:redoSortChildren/Siblings/TopLevel
    #@+node:EKR.20040526075238.5:redoTyping
    def redoTyping (self):
        
        u = self ; c = u.c ; current = c.currentPosition()
    
        # selectVnode causes recoloring, so avoid if possible.
        if current != u.p:
            c.selectVnode(u.p)
        elif u.undoType in ('Cut','Paste','Clear Recent Files'):
            c.frame.body.forceFullRecolor()
    
        self.undoRedoText(
            u.p,u.leading,u.trailing,
            u.newMiddleLines,u.oldMiddleLines,
            u.newNewlines,u.oldNewlines,
            tag="redo",undoType=u.undoType)
        
        if u.newSel:
            c.frame.body.setTextSelection(u.newSel)
        if u.yview:
            c.frame.body.setYScrollPosition(u.yview)
            
        u.redrawFlag = (current != u.p)
    #@nonl
    #@-node:EKR.20040526075238.5:redoTyping
    #@-node:ekr.20031218072017.2030:redo & allies
    #@+node:ekr.20031218072017.2039:undo & allies
    def undo (self):
    
        """Undo the operation described by the undo parmaters."""
        
        u = self ; c = u.c
        if not u.canUndo(): return
        if not u.getBead(u.bead): return
        if not c.currentPosition(): return
        # g.trace(len(u.beads),u.bead,u.peekBead(u.bead))
    
        c.endEditing()# Make sure we capture the headline for a redo.
        u.undoing = True
        u.redrawFlag = True
        u.updateSetChangedFlag = True
    
        c.beginUpdate()
        if 1: # update...
            try:
                func = u.undoDispatchDict[u.undoType]
            except KeyError:
                s = "Unknown undo key: %s" % u.undoType
                g.trace(s) ; g.es(s, color="red")
                func = None
            if func:
                func()
                if u.updateSetChangedFlag:
                    c.setChanged(True)
                    if u.p: u.p.setDirty(setDescendentsDirty=False)
        c.endUpdate(u.redrawFlag)
    
        u.undoing = False
        u.bead -= 1
        u.setUndoTypes()
    #@nonl
    #@+node:EKR.20040526090701.5:undoChangeAll
    def undoChangeAll (self):
        
        u = self ; c = u.c
    
        count = 0
        while 1:
            u.bead -= 1
            d = u.getBead(u.bead)
            assert(d)
            # g.trace(u.undoType,u.p,u.oldText)
            if u.undoType in ("Change All","Pretty Print"):
                c.selectVnode(u.p)
                break
            elif u.undoType == "Change":
                u.p.setTnodeText(u.oldText)
                count += 1
                u.p.setDirty()
            elif u.undoType == "Change Headline":
                u.p.initHeadString(u.oldText)
                count += 1
            else: assert False, "bad undo type:" % u.undoType
    
        g.es("undo %d instances" % count)
    #@nonl
    #@-node:EKR.20040526090701.5:undoChangeAll
    #@+node:EKR.20040526090701.6:undoChangeHeadline
    def undoChangeHeadline (self):
        
        u = self ; c = u.c
        
        # g.trace(u.oldText)
        
        u.p.setHeadStringOrHeadline(u.oldText)
        
        c.selectVnode(u.p)
    
        
    #@nonl
    #@-node:EKR.20040526090701.6:undoChangeHeadline
    #@+node:EKR.20040526083847:undoClone & undoDragClone
    def undoClone (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.deleteOutline()
        c.selectVnode(u.back)
    
    def undoDragClone (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.deleteOutline()
        c.selectVnode(u.oldV)
    #@nonl
    #@-node:EKR.20040526083847:undoClone & undoDragClone
    #@+node:EKR.20040526083847.1:undoDeleteNode
    #@+at 
    #@nonl
    # Deleting a clone is _not_ the same as undoing a clone:
    # the clone may have been moved, so there is no necessary relationship 
    # between the two nodes.
    #@-at
    #@@c
    
    def undoDeleteNode (self):
        
        u = self ; c = u.c
        
        if u.back:
            u.p.linkAfter(u.back)
        elif u.parent:
            u.p.linkAsNthChild(u.parent,0)
        else:
            oldRoot = c.rootPosition()
            u.p.linkAsRoot(oldRoot)
            
        # Restore all vnodeLists (and thus all clone marks).
        u.p.restoreLinksInTree()
    
        c.selectVnode(u.p)
    #@nonl
    #@-node:EKR.20040526083847.1:undoDeleteNode
    #@+node:ekr.20031218072017.3620:undoDemote
    def undoDemote (self):
        
        u = self ; c = u.c
    
        p   = u.p.copy()
        ins = u.p.copy()
        last = u.lastChild
        assert(p.hasFirstChild)
        child = p.firstChild()
        
        # Do not undemote children up to last.
        # Do not use an iterator here.
        if last:
            while child and child != last:
                child = child.next()
            if child:
                child = child.next()
    
        while child:
            next = child.next()
            child.moveAfter(ins)
            ins = child
            child = next
        c.selectVnode(p)
    #@nonl
    #@-node:ekr.20031218072017.3620:undoDemote
    #@+node:EKR.20040526083847.2:undoHoist and undoDehoist
    def undoHoist (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.dehoist()
        u.updateSetChangedFlag = False
    
    def undoDehoist (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.hoist()
        u.updateSetChangedFlag = False
    #@-node:EKR.20040526083847.2:undoHoist and undoDehoist
    #@+node:EKR.20040526084140:undoInsertNodes
    def undoInsertNodes (self):
        
        u = self ; c = u.c
        
        c.selectVnode(u.p)
        c.deleteOutline()
        if u.select:
            c.selectVnode(u.select)
    #@nonl
    #@-node:EKR.20040526084140:undoInsertNodes
    #@+node:EKR.20040526084140.1:undoMoveNode
    def undoMoveNode (self):
        
        u = self ; c = u.c
    
        # g.trace("oldParent",u.oldParent)
        
        if u.oldParent:
            u.p.moveToNthChildOf(u.oldParent,u.oldN)
        elif u.oldBack:
            u.p.moveAfter(u.oldBack)
        else:
            oldRoot = c.rootPosition() # Bug fix: 4/9/04
            u.p.moveToRoot(oldRoot)
    
        c.selectVnode(u.p)
    #@-node:EKR.20040526084140.1:undoMoveNode
    #@+node:ekr.20031218072017.3621:undoPromote
    # Undoes the previous promote operation.
    def undoPromote (self):
        
        u = self ; c = u.c
        next = u.p.next()
        last = u.lastChild
        assert(next)
        
        while next: # don't use an iterator here.
            p2 = next
            next = p2.next()
            n = u.p.numberOfChildren()
            p2.moveToNthChildOf(u.p,n)
            if p2 == last: break
        c.selectVnode(u.p)
    #@nonl
    #@-node:ekr.20031218072017.3621:undoPromote
    #@+node:ekr.20031218072017.1493:undoRedoText
    # Handle text undo and redo.
    # The terminology is for undo: converts _new_ text into _old_ text.
    
    def undoRedoText (self,p,
        leading,trailing, # Number of matching leading & trailing lines.
        oldMidLines,newMidLines, # Lists of unmatched lines.
        oldNewlines,newNewlines, # Number of trailing newlines.
        tag="undo", # "undo" or "redo"
        undoType=None):
    
        u = self ; c = u.c
        assert(p == c.currentPosition())
        v = p.v
    
        #@    << Incrementally update the Tk.Text widget >>
        #@+node:ekr.20031218072017.1494:<< Incrementally update the Tk.Text widget >>
        # Only update the changed lines.
        mid_text = string.join(oldMidLines,'\n')
        new_mid_len = len(newMidLines)
        # Maybe this could be simplified, and it is good to treat the "end" with care.
        if trailing == 0:
            c.frame.body.deleteLine(leading)
            if leading > 0:
                c.frame.body.insertAtEnd('\n')
            c.frame.body.insertAtEnd(mid_text)
        else:
            if new_mid_len > 0:
                c.frame.body.deleteLines(leading,new_mid_len)
            elif leading > 0:
                c.frame.body.insertAtStartOfLine(leading,'\n')
            c.frame.body.insertAtStartOfLine(leading,mid_text)
        # Try to end the Tk.Text widget with oldNewlines newlines.
        # This may be off by one, and we don't care because
        # we never use body text to compute undo results!
        s = c.frame.body.getAllText()
        newlines = 0 ; i = len(s) - 1
        while i >= 0 and s[i] == '\n':
            newlines += 1 ; i -= 1
        while newlines > oldNewlines:
            c.frame.body.deleteLastChar()
            newlines -= 1
        if oldNewlines > newlines:
            c.frame.body.insertAtEnd('\n'*(oldNewlines-newlines))
        #@nonl
        #@-node:ekr.20031218072017.1494:<< Incrementally update the Tk.Text widget >>
        #@nl
        #@    << Compute the result using v's body text >>
        #@+node:ekr.20031218072017.1495:<< Compute the result using v's body text >>
        # Recreate the text using the present body text.
        body = v.bodyString()
        body = g.toUnicode(body,"utf-8")
        body_lines = body.split('\n')
        s = []
        if leading > 0:
            s.extend(body_lines[:leading])
        if len(oldMidLines) > 0:
            s.extend(oldMidLines)
        if trailing > 0:
            s.extend(body_lines[-trailing:])
        s = string.join(s,'\n')
        # Remove trailing newlines in s.
        while len(s) > 0 and s[-1] == '\n':
            s = s[:-1]
        # Add oldNewlines newlines.
        if oldNewlines > 0:
            s = s + '\n' * oldNewlines
        result = s
        if u.debug_print:
            print "body:  ",body
            print "result:",result
        #@nonl
        #@-node:ekr.20031218072017.1495:<< Compute the result using v's body text >>
        #@nl
        # g.trace(v)
        # g.trace("old:",v.bodyString())
        v.setTnodeText(result)
        # g.trace("new:",v.bodyString())
        #@    << Get textResult from the Tk.Text widget >>
        #@+node:ekr.20031218072017.1496:<< Get textResult from the Tk.Text widget >>
        textResult = c.frame.body.getAllText()
        
        if textResult != result:
            # Remove the newline from textResult if that is the only difference.
            if len(textResult) > 0 and textResult[:-1] == result:
                textResult = result
        #@nonl
        #@-node:ekr.20031218072017.1496:<< Get textResult from the Tk.Text widget >>
        #@nl
        if textResult == result:
            if undoType in ("Cut","Paste"):
                # g.trace("non-incremental undo")
                c.frame.body.recolor(p,incremental=False)
            else:
                # g.trace("incremental undo:",leading,trailing)
                c.frame.body.recolor_range(p,leading,trailing)
        else: # 11/19/02: # Rewrite the pane and do a full recolor.
            if u.debug_print:
                #@            << print mismatch trace >>
                #@+node:ekr.20031218072017.1497:<< print mismatch trace >>
                print "undo mismatch"
                print "expected:",result
                print "actual  :",textResult
                #@nonl
                #@-node:ekr.20031218072017.1497:<< print mismatch trace >>
                #@nl
            # g.trace("non-incremental undo")
            p.setBodyStringOrPane(result)
    #@nonl
    #@-node:ekr.20031218072017.1493:undoRedoText
    #@+node:ekr.20031218072017.1714:undoReplace
    #@+at 
    #@nonl
    # This routine implements undo for any kind of operation, no matter how 
    # complex.  Just do:
    # 
    #     v_copy = c.undoer.saveTree(v)
    #     ...make arbitrary changes to p's tree.
    #     c.undoer.setUndoParams("Op Name",p,select=current,oldTree=v_copy)
    #@-at
    #@@c
    
    def undoReplace (self,p,new_data,old_data):
    
        """Replace p.v and its subtree using old_data during undo."""
    
        u = self ; c = u.c
        if 0:
            # g.trace(u.undoType,"u.bead",u.bead)
            g.trace("new_data:",new_data)
            g.trace("old_data:",old_data)
    
        if new_data == None:
            # This is the first time we have undone the operation.
            # Put the new data in the bead.
            d = u.beads[u.bead]
            d["newTree"] = u.saveTree(p.copy())
            u.beads[u.bead] = d
    
        # Replace data in tree with old data.
        u.restoreTree(old_data)
        p.setBodyStringOrPane(p.bodyString())
    
        return p # Nothing really changes.
    #@nonl
    #@-node:ekr.20031218072017.1714:undoReplace
    #@+node:EKR.20040526090701.3:undoReplaceNodes & undoReplaceNodesContents
    def undoReplaceNodes (self):
        
        u = self ; c = u.c
    
        u.p = self.undoReplace(u.p,u.newTree,u.oldTree)
        c.selectVnode(u.p) # Does full recolor.
        if u.oldSel:
            c.frame.body.setTextSelection(u.oldSel)
        
    def undoReplaceNodesContents (self):
        
        u = self ; c = u.c
        
        u.undoReplaceNodes()
        u.redrawFlag = False
    #@nonl
    #@-node:EKR.20040526090701.3:undoReplaceNodes & undoReplaceNodesContents
    #@+node:ekr.20031218072017.3622:undoSortChildren
    def undoSortChildren (self):
    
        u = self ; c = u.c
        assert(u.p)
    
        c.endEditing()
        index = 0
        for child in u.sort:
            child.moveToNthChildOf(u.p,index)
            index += 1
    #@nonl
    #@-node:ekr.20031218072017.3622:undoSortChildren
    #@+node:ekr.20031218072017.3623:undoSortSiblings
    def undoSortSiblings (self):
        
        u = self ; c = u.c
    
        parent = u.p.parent()
        assert(u.p and parent)
        
        c.endEditing()
        index = 0
        for sib in u.sort:
            sib.moveToNthChildOf(parent,index)
            index += 1
        parent.setDirty()
    #@nonl
    #@-node:ekr.20031218072017.3623:undoSortSiblings
    #@+node:ekr.20031218072017.3624:undoSortTopLevel
    def undoSortTopLevel (self):
        
        u = self ; c = u.c
        root = c.rootPosition()
        
        c.endEditing()
        v = u.sort[0]
        v.moveToRoot(oldRoot=root)
        for next in u.sort[1:]:
            next.moveAfter(v)
            v = next
            
        u.p = None # don't mark u.p dirty
    #@nonl
    #@-node:ekr.20031218072017.3624:undoSortTopLevel
    #@+node:EKR.20040526090701.4:undoTyping
    def undoTyping (self):
        
        u = self ; c = u.c ; current = c.currentPosition()
    
        # g.trace(u.undoType,u.p)
        # selectVnode causes recoloring, so don't do this unless needed.
        if current != u.p:
            c.selectVnode(u.p)
        elif u.undoType in ("Cut","Paste",'Clear Recent Files'):
            c.frame.body.forceFullRecolor()
    
        self.undoRedoText(
            u.p,u.leading,u.trailing,
            u.oldMiddleLines,u.newMiddleLines,
            u.oldNewlines,u.newNewlines,
            tag="undo",undoType=u.undoType)
        if u.oldSel:
            c.frame.body.setTextSelection(u.oldSel)
        if u.yview:
            c.frame.body.setYScrollPosition(u.yview)
            
        u.redrawFlag = (current != u.p)
    #@nonl
    #@-node:EKR.20040526090701.4:undoTyping
    #@-node:ekr.20031218072017.2039:undo & allies
    #@-others
    
class undoer (baseUndoer):
    """A class that implements unlimited undo and redo."""
    pass
#@nonl
#@-node:ekr.20031218072017.3605:class undoer
#@+node:ekr.20031218072017.2243:class nullUndoer
class nullUndoer (undoer):

    def __init__ (self,c):
        
        undoer.__init__(self,c) # init the base class.
        
    def clearUndoState (self):
        pass
        
    def canRedo (self):
        return False

    def canUndo (self):
        return False
        
    def enableMenuItems (self):
        pass

    def getBead (self,n):
        return {}
    
    def peekBead (self,n):
        return {}

    def setBead (self,n,keywords=None):
        return {}

    def redoMenuName (self,name):
        return "Can't Redo"
    
    def undoMenuName (self,name):
        return "Can't Undo"
            
    def setUndoParams (self,undo_type,v,**keywords):
        pass
        
    def setUndoTypingParams (self,v,undo_type,oldText,newText,oldSel,newSel,oldYview=None):
        pass
        
    def setUndoTypes (self):
        pass
#@-node:ekr.20031218072017.2243:class nullUndoer
#@-others
#@nonl
#@-node:ekr.20031218072017.3603:@thin leoUndo.py
#@-leo
