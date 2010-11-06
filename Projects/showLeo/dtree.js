//@+leo-ver=4
//@+node:@file dtree.js
//@@language java
//@@tabwidth 4

//@<< copyright >>
//@+node:<< copyright >>
/*--------------------------------------------------|
| dTree 2.05 | www.destroydrop.com/javascript/tree/ |
|---------------------------------------------------|
| Copyright (c) 2002-2003 Geir Landrö               |
|                                                   |
| This script can be used freely as long as all     |
| copyright messages are intact.                    |
|                                                   |
| Updated: 17.04.2003                               |
|--------------------------------------------------*/
//@nonl
//@-node:<< copyright >>
//@nl

//@+others
//@+node: dTree (ctor)
function dTree(objName) {
	this.config = {
		target         : null,
		folderLinks    : true,
		useSelection   : true,
		useCookies     : true,
		useLines       : true,
		useIcons       : true,
		useStatusText  : false,
		closeSameLevel : false,
		inOrder        : false
	}
	this.icon = {
		root        : 'LeoWin.gif', // 'img/base.gif'
		folder      : 'folder.gif',
		folderOpen  : 'folderopen.gif',
		node        : 'page.gif',
		empty       : 'empty.gif',
		line        : 'line.gif',
		join        : 'join.gif',
		joinBottom  : 'joinbottom.gif',
		plus        : 'plus.gif',
		plusBottom  : 'plusbottom.gif',
		minus       : 'minus.gif',
		minusBottom : 'minusbottom.gif',
		nlPlus      : 'nolines_plus.gif',
		nlMinus     : 'nolines_minus.gif'
	};
	this.obj = objName
	this.aNodes = []
	this.aIndent = []
	this.root = new Node(-1)
	this.selectedNode = null
	this.selectedFound = false
	this.completed = false
}
//@nonl
//@-node: dTree (ctor)
//@+node:addv (EKR: called by statically generated html file)
// dTree.prototype.add = function(id, pid, name, body, url, title, target, icon, iconOpen, open)

dTree.prototype.addv = function(id,pid,npid,head,body,gFile,icon,expanded)
{
	// npid not used at present.
	this.add(id,pid,head,body,gFile,"","",icon,icon,expanded)
}
//@-node:addv (EKR: called by statically generated html file)
//@+node:add (called by init once for every vnode)
// Adds a new node to the node array.

// id       Number Unique identity number. 
// pid      Number Number refering to the parent node. The value for the root node has to be -1. 
// name     String Text label for the node. 
// url      String Url for the node. 
// title    String Title for the node. 
// target   String Target for the node. 
// icon     String Image file to use as the icon. Uses default if not specified. 
// iconOpen String Image file to use as the open icon. Uses default if not specified. 
// open     Boolean Is the node open.

dTree.prototype.add = function(id, pid, name, body, url, title, target, icon, iconOpen, open)
{
	this.aNodes[this.aNodes.length] =
		new Node(id, pid, name, body, url, title, target, icon, iconOpen, open)
}
//@nonl
//@-node:add (called by init once for every vnode)
//@+node:addNode (use arr)(called by toString)
// Creates the tree structure
dTree.prototype.addNode = function(pNode)
{
	var arr = new Array()
	var n=0
	if (this.config.inOrder) n = pNode._ai
	for (n; n<this.aNodes.length; n++) {
		if (this.aNodes[n].pid == pNode.id) {
			var cn = this.aNodes[n]
			cn._p = pNode
			cn._ai = n
			this.setCS(cn) // This might also be pretty slow.
			if (!cn.target && this.config.target)
				cn.target = this.config.target
			if (cn._hc && !cn._io && this.config.useCookies)
				cn._io = this.isOpen(cn.id)
			if (!this.config.folderLinks && cn._hc)
				cn.url = null
			if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {
				cn._is = true
				this.selectedNode = n
				this.selectedFound = true
			}
			arr.push(this.node(cn, n)) // EKR: A big speedup.
			if (cn._ls) break
		}
	}
	return arr.join(' ')
}
//@nonl
//@-node:addNode (use arr)(called by toString)
//@+node:Node
// Node object.

// id       Number Unique identity number. 
// pid      Number Number refering to the parent node. The value for the root node has to be -1. 
// name     String Text label for the node. 
// url      String Url for the node. 
// title    String Title for the node. 
// target   String Target for the node. 
// icon     String Image file to use as the icon. Uses default if not specified. 
// iconOpen String Image file to use as the open icon. Uses default if not specified. 
// open     Boolean Is the node open.

function Node(id, pid, name, body, url, title, target, icon, iconOpen, open) {
	this.id = id
	this.pid = pid
	this.name = name
	this.body = body // ekr
	this.url = url
	this.title = title
	this.target = target
	this.icon = icon
	this.iconOpen = iconOpen
	this._io = open || false
	this._is = false
	this._ls = false
	this._hc = false
	this._ai = 0
	this._p
}
//@nonl
//@-node:Node
//@+node:node (creates HTML, possibly bad recursion)
// Creates the node icon, url and text
dTree.prototype.node = function(node, nodeId)
{
	var arr = new Array()

	arr.push('<div class="dTreeNode">' + this.indent(node, nodeId))

	if (this.config.useIcons) {
		//@		<< configure for icons >>
		//@+node:<< configure for icons >>
		if (!node.icon) node.icon =
			(this.root.id == node.pid) ?
			this.icon.root :
			((node._hc) ? this.icon.folder : this.icon.node);
		
		if (!node.iconOpen)
			node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;
		
		if (this.root.id == node.pid) {
			node.icon = this.icon.root;
			node.iconOpen = this.icon.root;
		}
		
		arr.push(
			'<img id="i' + this.obj + nodeId
			+ '" src="'
			+ ((node._io) ? node.iconOpen : node.icon)
			+ '" alt="" />')
		//@nonl
		//@-node:<< configure for icons >>
		//@nl
	}

	if (node.url) {
		//@		<< configure for url >>
		//@+node:<< configure for url >>
		arr.push('<a id="s' + this.obj + nodeId + '" class="' +
			((this.config.useSelection) ? ((node._is ? 'nodeSel' : 'node')) : 'node')
			+ '" href="' + node.url + '"')
		
		if (node.title)
			arr.push(str += ' title="' + node.title + '"')
		
		if (node.target)
			arr.push(' target="' + node.target + '"')
		
		if (this.config.useStatusText)
			arr.push(' onmouseover="window.status=\''
			+ node.name
			+ '\';return true;" onmouseout="window.status=\'\';return true;" ')
		
		if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc))
			arr.push(' onclick="javascript: ' + this.obj + '.s(' + nodeId + ');"')
		
		arr.push('>')
		//@nonl
		//@-node:<< configure for url >>
		//@nl
	}
	else if ((!this.config.folderLinks || !node.url) && node._hc && node.pid != this.root.id)
		arr.push('<a href="javascript: ' + this.obj + '.o(' + nodeId + ');" class="node">')

	arr.push(node.name)
	
	if (node.url || ((!this.config.folderLinks || !node.url) && node._hc))
		arr.push('</a>')
		
	arr.push('</div>')
	
	if (node._hc) {
		//@		<< configure for children >>
		//@+node:<< configure for children >> (bad recursion)
		arr.push('<div id="d' + this.obj
			+ nodeId + '" class="clip" style="display:'
			+ ((this.root.id == node.pid || node._io) ? 'block' : 'none')
			+ ';">')
			
		// EKR: this recursion could be very slow.
		arr.push(this.addNode(node))
		arr.push('</div>')
		//@-node:<< configure for children >> (bad recursion)
		//@nl
	}
	this.aIndent.pop()
	return arr.join(' ')
}
//@nonl
//@-node:node (creates HTML, possibly bad recursion)
//@+node:toString (EKR: added textarea)
// Output the tree to the page.

dTree.prototype.toString = function()
{
	var str = ''
	str += '<div class="dtree">\n'

	if (document.getElementById) {
		if (this.config.useCookies)
			this.selectedNode = this.getSelected()
		str += this.addNode(this.root)
	}
	else
		str += 'Browser not supported.'
		
	if (1) { // Added by EKR
		if (this.selectedNode==null || this.selectedNode==undefined)
			body = ""
		else
			body = this.aNodes[this.selectedNode].body
		
		str += '<TEXTAREA name="bodyPane" ROWS="15" COLS="90" WRAP="OFF">'
			+ body
			+ '</TEXTAREA>'
	}

	str += '</div>'

	if (!this.selectedFound) this.selectedNode = null
	this.completed = true
	return str
}
//@nonl
//@-node:toString (EKR: added textarea)
//@+node:indent
// Adds the empty and line icons.

dTree.prototype.indent = function(node, nodeId)
{
	var str = ''
	if (this.root.id != node.pid) {
		for (var n=0; n<this.aIndent.length; n++)
			str += '<img src="'
			+ ((this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty)
			+ '" alt="" />'

		this.aIndent.push(node._ls ? 0 : 1)
	
		if (node._hc) {
			//@			<< add child line >>
			//@+node:<< add child line >>
			str += '<a href="javascript: '
			+ this.obj + '.o(' + nodeId + ');">'
			+ '<img id="j' + this.obj + nodeId
			+ '" src="';
			if (!this.config.useLines)
				str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;
			else
				str += (
					(node._io) ?
					((node._ls && this.config.useLines) ? this.icon.minusBottom : this.icon.minus) :
					((node._ls && this.config.useLines) ? this.icon.plusBottom : this.icon.plus ) );
			str += '" alt="" /></a>';
			//@nonl
			//@-node:<< add child line >>
			//@nl
		}
		else {
			//@			<< add image line >>
			//@+node:<< add image line >>
			str += '<img src="'
				+ ((this.config.useLines) ?
					((node._ls) ? this.icon.joinBottom : this.icon.join ) :
					this.icon.empty)
				+ '" alt="" />'
			//@nonl
			//@-node:<< add image line >>
			//@nl
		}
	}
	return str
}
//@nonl
//@-node:indent
//@+node:setCS
// Sets node._ls if node is the last sibling.

dTree.prototype.setCS = function(node)
{
	var lastId

	for (var n=0; n<this.aNodes.length; n++) {
		if (this.aNodes[n].pid == node.id) node._hc = true
		if (this.aNodes[n].pid == node.pid) lastId = this.aNodes[n].id
	}

	if (lastId==node.id) node._ls = true
}
//@nonl
//@-node:setCS
//@+node:getSelected
// Returns the selected node.

dTree.prototype.getSelected = function()
{
	var sn = this.getCookie('cs' + this.obj)
	
	return (sn) ? sn : null
}
//@nonl
//@-node:getSelected
//@+node:s (highlight selected node)
// Highlights the selected node.

dTree.prototype.s = function(id)
{
	if (!this.config.useSelection) return;
	
	var cn = this.aNodes[id]
	
	if (cn._hc && !this.config.folderLinks) return;

	if (this.selectedNode != id) {
		if (this.selectedNode || this.selectedNode==0) {
			eOld = document.getElementById("s" + this.obj + this.selectedNode)
			eOld.className = "node"
		}

		eNew = document.getElementById("s" + this.obj + id)
		eNew.className = "nodeSel"
		this.selectedNode = id

		if (this.config.useCookies)
			this.setCookie('cs' + this.obj, cn.id)
	}
}
//@nonl
//@-node:s (highlight selected node)
//@+node:openAll & closeAll
// Open/close all nodes
dTree.prototype.openAll = function() {
	this.oAll(true);
};

dTree.prototype.closeAll = function() {
	this.oAll(false);
};
//@nonl
//@-node:openAll & closeAll
//@+node:o
// Toggle Open or close

dTree.prototype.o = function(id)
{
	var cn = this.aNodes[id]
	
	this.nodeStatus(!cn._io, id, cn._ls);
	cn._io = !cn._io
	
	if (this.config.closeSameLevel)
		this.closeLevel(cn)
	if (this.config.useCookies)
		this.updateCookie()
}
//@nonl
//@-node:o
//@+node:oAll
// Open or close all nodes
dTree.prototype.oAll = function(status) {
	for (var n=0; n<this.aNodes.length; n++) {
		if (this.aNodes[n]._hc && this.aNodes[n].pid != this.root.id) {
			this.nodeStatus(status, n, this.aNodes[n]._ls)
			this.aNodes[n]._io = status
		}
	}
	if (this.config.useCookies)
		this.updateCookie()
}
//@nonl
//@-node:oAll
//@+node:openTo
// Opens the tree to a specific node
dTree.prototype.openTo = function(nId, bSelect, bFirst) {
	if (!bFirst) {
		for (var n=0; n<this.aNodes.length; n++) {
			if (this.aNodes[n].id == nId) {
				nId=n;
				break;
			}
		}
	}
	var cn=this.aNodes[nId];
	if (cn.pid==this.root.id || !cn._p) return;
	cn._io = true;
	cn._is = bSelect;
	if (this.completed && cn._hc) this.nodeStatus(true, cn._ai, cn._ls);
	if (this.completed && bSelect) this.s(cn._ai);
	else if (bSelect) this._sn=cn._ai;
	this.openTo(cn._p._ai, false, true);
};

//@-node:openTo
//@+node:closeLevel
// Closes all nodes on the same level as certain node
dTree.prototype.closeLevel = function(node)
{
	for (var n=0; n<this.aNodes.length; n++) {
		if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {
			this.nodeStatus(false, n, this.aNodes[n]._ls);
			this.aNodes[n]._io = false;
			this.closeAllChildren(this.aNodes[n]);
		}
	}
}
//@nonl
//@-node:closeLevel
//@+node:closeAllChildren
// Closes all children of a node
dTree.prototype.closeAllChildren = function(node) {
	for (var n=0; n<this.aNodes.length; n++) {
		if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {
			if (this.aNodes[n]._io) this.nodeStatus(false, n, this.aNodes[n]._ls);
			this.aNodes[n]._io = false;
			this.closeAllChildren(this.aNodes[n]);		
		}
	}
}
//@-node:closeAllChildren
//@+node:nodeStatus
// Change the status of a node(open or closed).

dTree.prototype.nodeStatus = function(status, id, bottom)
{
	eDiv	 = document.getElementById('d' + this.obj + id)
	eJoin	= document.getElementById('j' + this.obj + id)

	if (this.config.useIcons) {
		eIcon	= document.getElementById('i' + this.obj + id)
		eIcon.src = (status) ? this.aNodes[id].iconOpen : this.aNodes[id].icon
	}

	eJoin.src = (this.config.useLines)?
		((status)?
		 ((bottom)?this.icon.minusBottom : this.icon.minus):
		 ((bottom)?this.icon.plusBottom  : this.icon.plus)
		)
		:
		((status)?this.icon.nlMinus:this.icon.nlPlus)

	eDiv.style.display = (status) ? 'block': 'none'
}
//@nonl
//@-node:nodeStatus
//@+node:clearCookie
// [Cookie] Clears a cookie
dTree.prototype.clearCookie = function()
{
	var now = new Date()
	var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24)

	this.setCookie('co'+this.obj, 'cookieValue', yesterday)
	this.setCookie('cs'+this.obj, 'cookieValue', yesterday)
}
//@nonl
//@-node:clearCookie
//@+node:setCookie
// [Cookie] Sets value in a cookie
dTree.prototype.setCookie = function(cookieName, cookieValue, expires, path, domain, secure)
{
	document.cookie =
		escape(cookieName) + '=' + escape(cookieValue)
		+ (expires ? '; expires=' + expires.toGMTString() : '')
		+ (path ? '; path=' + path : '')
		+ (domain ? '; domain=' + domain : '')
		+ (secure ? '; secure' : '')
}
//@nonl
//@-node:setCookie
//@+node:getCookie
// [Cookie] Gets a value from a cookie.

dTree.prototype.getCookie = function(cookieName)
{
	var cookieValue = ''
	var posName = document.cookie.indexOf(escape(cookieName) + '=')

	if (posName != -1) {
		var posValue = posName + (escape(cookieName) + '=').length
		var endPos   = document.cookie.indexOf(';', posValue)

		if (endPos != -1)
			cookieValue = unescape(document.cookie.substring(posValue, endPos))
		else
			cookieValue = unescape(document.cookie.substring(posValue))
	}

	return (cookieValue);
}
//@nonl
//@-node:getCookie
//@+node:updateCookie
// [Cookie] Returns ids of open nodes as a string.

dTree.prototype.updateCookie = function()
{
	var str = ''

	for (var n=0; n<this.aNodes.length; n++) {
		if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {
			if (str) str += '.'
			str += this.aNodes[n].id
		}
	}
	this.setCookie('co' + this.obj, str)
}
//@nonl
//@-node:updateCookie
//@+node:isOpen
// [Cookie] Checks if a node id is in a cookie.

dTree.prototype.isOpen = function(id)
{
	var aOpen = this.getCookie('co' + this.obj).split('.');
	for (var n=0; n<aOpen.length; n++)
		if (aOpen[n] == id) return true;
	return false;
};
//@nonl
//@-node:isOpen
//@-others

// If Push and pop is not implemented by the browser
if (!Array.prototype.push) {
	Array.prototype.push = function array_push() {
		for(var i=0;i<arguments.length;i++)
			this[this.length]=arguments[i]
		return this.length
	}
}

if (!Array.prototype.pop) {
	Array.prototype.pop = function array_pop() {
		lastElement = this[this.length-1]
		this.length = Math.max(this.length-1,0)
		return lastElement
	}
}
//@-node:@file dtree.js
//@-leo
