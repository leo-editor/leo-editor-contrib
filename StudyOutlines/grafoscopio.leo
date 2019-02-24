<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20190224024812.1"><vh>Read me</vh></v>
<v t="ekr.20190224024804.1"><vh>Grafoscopio study</vh>
<v t="ekr.20190224024804.2"><vh>class GrafoscopioNode</vh>
<v t="ekr.20190224024804.3"><vh>methodsFor: 'utility'</vh></v>
<v t="ekr.20190224024804.4"><vh>methodsFor: 'initialization'</vh></v>
<v t="ekr.20190224024804.5"><vh>methodsFor: 'accessing'</vh>
<v t="ekr.20190224024804.6"><vh>Getters</vh></v>
<v t="ekr.20190224024804.7"><vh>Setters</vh></v>
</v>
<v t="ekr.20190224024804.8"><vh>methodsFor: 'operation'</vh></v>
<v t="ekr.20190224024804.9"><vh>methodsFor: 'add/remove nodes'</vh></v>
<v t="ekr.20190224024804.10"><vh>methodsFor: 'movement'</vh></v>
<v t="ekr.20190224024804.11"><vh>methodsFor: 'importing'</vh></v>
<v t="ekr.20190224024804.12"><vh>methodsFor: 'exporting'</vh></v>
<v t="ekr.20190224024804.13"><vh>methodsFor: 'instance creation'</vh></v>
<v t="ekr.20190224024804.14"><vh>methodsFor: 'custom markup'</vh></v>
<v t="ekr.20190224024804.15"><vh>methodsFor: 'utility'</vh></v>
</v>
<v t="ekr.20190224024804.16"><vh>Other classes</vh>
<v t="ekr.20190224024804.17"><vh>FileUtils</vh></v>
<v t="ekr.20190224024804.18"><vh>FontAwesome</vh></v>
<v t="ekr.20190224024804.20"><vh>GrafoscopioButtonModel</vh></v>
<v t="ekr.20190224024804.21"><vh>GrafoscopioCodeModel</vh></v>
<v t="ekr.20190224024804.22"><vh>GrafoscopioDocs</vh></v>
<v t="ekr.20190224024804.23"><vh>GrafoscopioLinksList</vh></v>
<v t="ekr.20190224024804.24"><vh>GrafoscopioLinkstModel</vh></v>
<v t="ekr.20190224024804.25"><vh>GrafoscopioNodeTest</vh></v>
<v t="ekr.20190224024804.26"><vh>GrafoscopioNotebook</vh></v>
<v t="ekr.20190224024804.27"><vh>GrafoscopioNotebookTest</vh></v>
<v t="ekr.20190224024804.28"><vh>GrafoscopioReplace</vh></v>
<v t="ekr.20190224024804.29"><vh>GrafoscopioTextModel</vh></v>
<v t="ekr.20190224024804.30"><vh>GuiHelpers</vh></v>
<v t="ekr.20190224024804.31"><vh>ManifestGrafoscopio</vh></v>
<v t="ekr.20190224024804.32"><vh>MendaIcons</vh></v>
<v t="ekr.20190224024804.33"><vh>MindMap</vh></v>
<v t="ekr.20190224024804.34"><vh>Pandoc</vh></v>
</v>
<v t="ekr.20190224024804.19"><vh>GfWorldMenu</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20190224024804.1">@language smalltalk

</t>
<t tx="ekr.20190224024804.10">demote
	"Move the current node down in the hierachy, making it a children of its current previous slibing"
	| collection index predecessor |
	collection := self parent children.
	index := collection indexOf: self.
	(index between: 2 and: collection size)
		ifTrue: [ predecessor := collection before: self.
			collection remove: self.
			predecessor addNode: self] 

moveAfter
	"Moves the current node a place before in the children collection where is located"
	| collection index successor |
	collection := self parent children.
	index := collection indexOf: self.
	(index between: 1 and: collection size - 1)
		ifTrue: [
			successor := collection after: self.
			collection at: index + 1 put: self.
			collection at: index  put: successor]

moveBefore
	"Moves the current node a place before in the children collection where is located"
	| collection index predecessor |
	collection := self parent children.
	index := collection indexOf: self.
	(index between: 2 and: collection size)
		ifTrue: [
			predecessor := collection before: self.
			collection at: index -1 put: self.
			collection at: index  put: predecessor]
	
promote
	"Move the current node up in the hierachy, making it a slibing of its current parent"
	| collection grandparent |
	collection := self parent children.
	grandparent := self parent parent.
	collection isNotNil &amp; grandparent isNotNil 
		ifTrue: [ 
			(grandparent children) add: self after: (self parent).
			self level: (self parent) level.
			self parent: grandparent.
			collection remove: self.]</t>
<t tx="ekr.20190224024804.11">importHtmlLink
	"I take the last link and import its contents in node body. "
	| selectedLink downloadedContent |
	self links last asUrl host = 'ws.stfx.eu' ifTrue: [ ^ self ].
	selectedLink := self links last.
	downloadedContent := (GrafoscopioUtils 
		downloadingFrom: selectedLink 
		withMessage: 'Downloading node contents...' 
		into: FileLocator temp). 
	self uploadBodyFrom: downloadedContent filteredFor: selectedLink.

importPlaygroundLink
	"I take the last link and import its contents in node body. 
	Last links should be hosted in http://zn.stfx.eu/"
	self links last asUrl host = 'ws.stfx.eu' ifFalse: [ ^ self ].
	self
		body: (ZnClient new get: self links last);
		tagAs: 'código'.

uploadBodyFrom: fileLocator filteredFor: selectedLink
	(self linksFilters contains: selectedLink)
		ifFalse: [ self body: fileLocator contents ]
</t>
<t tx="ekr.20190224024804.12">asMarkdown
	"I export children of the current node as pandoc markdown, using special nodes accoding to tags."
	" Early version... tags processing should be vastly improved"
	| markdownOutput |
	markdownOutput := '' writeStream.
	"self metadataAsYamlIn: markdownOutput."
	(self preorderTraversal) do: [ :eachNode | 
		(eachNode level &gt; 0) 
			ifTrue: [(eachNode hasAncestorTaggedAs: 'invisible') 
						| (eachNode tags includes: 'invisible')
							ifFalse: [markdownOutput nextPutAll: (eachNode markdownContent) ]]].
	^ markdownOutput contents

asSton
	"Exports current tree as STON format"
	| stonOutput |
	
	stonOutput := '' writeStream.
	self flatten.
	stonOutput nextPutAll:  (STON toStringPretty: self children).	
	^stonOutput contents
    
bodyAsCode
	"I return the node body with proper decorators added to show them as raw code"
	| codeBody |
	codeBody := '' writeStream.
	codeBody 
		nextPutAll:  '~~~{.numberLines}'; lf;
		nextPutAll: (self body contents asString withInternetLineEndings); lf;
	   nextPutAll:  '~~~'; lf; lf.
	^ codeBody contents

bodyAsMarkdownInto: aStream
	"I export the header as markdown using the level inside the tree to determine hierarchy"
	"and replacing all line endings to make them Internet friendly".
	self embeddedNodes ifNotNil: [ aStream nextPutAll: (self embedNodes contents asString withInternetLineEndings); crlf; crlf].
    
exportCodeBlockTo: aStream
	"I convert the content of a node taged as 'código' (code) as pandoc markdown and put it 
	into aStream."
	aStream nextPutAll:  ('~~~{.numberLines}'); lf.
	aStream nextPutAll: (self body contents asString withInternetLineEndings); lf.
	aStream nextPutAll:  ('~~~'); lf;lf.
	^aStream contents
    
exportCodeOutputTo: aStream
	"I convert the output of a node taged as 'código' (code) as pandoc markdown and put it into aStream."
	(self headerStartsWith: '%metadata') ifTrue: [ ^ self ].
	aStream nextPutAll:  ('~~~{.numberLines}'); lf.
	aStream nextPutAll: (self output asString withInternetLineEndings); lf.
	aStream nextPutAll:  ('~~~'); lf;lf.
	^aStream contents
    
exportCodeNodeTo: aStream
	"I convert the content of a node taged as 'código' (code) as pandoc markdownand put it into aStream."
	((self headerStartsWith: '%output') or: [ self headerStartsWith: '%metadata' ])
		ifTrue: [ self exportCodeOutputTo: aStream ]
		ifFalse: [ self exportCodeBlockTo: aStream ]

exportLaTeXCodeBlockTo: aStream
	"I convert the content of a node taged as 'código' (code) as pandoc markdown and put it 
	into aStream.
	The code block is decorated with LaTeX commands for proper syntax highlighting using pygments.
	Pdf exportation requires the installation of pygments and minted package for latex"
	aStream nextPutAll:  ('\begin{minted}{smalltalk}'); lf.
	aStream nextPutAll: (self body contents asString withInternetLineEndings); lf.
	aStream nextPutAll: '\end{minted}';lf;lf.
	^aStream contents 
    
exportPreambleTo: aStream
	"comment stating purpose of message"
	| configDict |
	(self header = '%config')
		ifTrue: [ 
			configDict := STON fromString: (self body).
			aStream nextPutAll: 'title: ', (configDict at: 'title'); lf.
			aStream nextPutAll: 'author: ', ((configDict at: 'author') at: 'given'), ' ', ((configDict at: 'author') at: 'family'); lf.
			aStream nextPutAll: 'bibliography: ', (configDict at: 'bibliography'); lf.
			aStream nextPutAll: 'abstract: ', '|'; lf; nextPutAll: (configDict at: 'abstract'); lf]
            
flatten
	"I traverse the tree looking for node bodies containing 'Text' objects and transform them to"
	"their string content, so space is saved and storage format is DVCS friendly while serializing them to STON"
	(self preorderTraversal) do: [ :eachNode | 
			(eachNode body class = Text)
				ifTrue: [eachNode body: (eachNode body asString)]]
            
footnoteAsMarkdownInto: aStream
	"I export a node with %footnode in its header for valid Pandoc's markdown"
	"and replace all line endings to make them Internet friendly."
	Maybe I should include the condition about my own header, instead of leaving it to markdownCotent..."
	aStream nextPutAll: ('[^',(self header copyReplaceAll: '%footnote ' with: ''),']: ' ); lf.
	self body contents withInternetLineEndings 
		linesDo: [ :line | aStream nextPutAll: '    ', line; lf ].
	aStream nextPutAll: String lf.
    
hasAncestorHeaderWith: aSpecialWord
	"Looks if the receptor node has an ancestor with a header with 'aSpecialWord' as the only or the first word"
	^ (self ancestorsHeaders includes: aSpecialWord) | ((self ancestorsHeaders collect: [:eachHeader | (eachHeader findTokens: $  ) at: 1 ]) includes: aSpecialWord) 

headerAsMarkdownInto: aStream
	"I export the header as markdown using the level inside the tree to determine hierarchy
	and replacing all line endings to make them Internet friendly"
	self level timesRepeat: [ aStream nextPutAll: '#' ].
		aStream nextPutAll: ' '. 
		aStream nextPutAll: (self header copyReplaceTokens: #cr with: #lf); crlf; crlf.

hasAncestorTaggedAs: aSpecialWord
	"Looks if the receptor node has an ancestor with a header with 'aSpecialWord' in its tags"
	self ancestors detect: [:eachAncestor | eachAncestor tags includes: aSpecialWord ] 
		ifFound: [^true ] 
		ifNone: [^false ].
        
itemAsMarkdownInto: aStream
	"Export a node with %item in its header as valid Pandoc's markdown"
	"and replace all line endings to make them Internet friendly."
	"Maybe I should include the condition about my own header, instead of leaving it to markdownContent..."
	| lines |
	lines := self body contents asString withInternetLineEndings lines.
	lines ifEmpty: [ ^ self ].
	aStream
		nextPutAll: '  - ';
		nextPutAll: lines first;
		lf.
	lines
		allButFirstDo: [ :line | 
			aStream nextPutAll: '    '; nextPutAll: line; lf ].
	aStream nextPutAll: String lf
    
margin
	"I define the same margin of the page used for PDF exportations"
	^'2 cm'
    
margins
	"I define each individual margin of the page used for PDF exportations"
	| margins |
	margins := Dictionary new
		add: 'top' -&gt; '3 cm';
		add: 'bottom' -&gt; '3 cm';
		add: 'left' -&gt; '2 cm';
		add: 'right' -&gt; '2 cm';
		yourself.
	^ margins

markdownContent
	"I extract the markdown of a node using body as content, header as title and level as
	 hierarchical level of the title.
	 If special nodes types are present, that use %keywords in its header or body I convert them
	 into proper markup"
	| markdownStream |
	markdownStream := '' writeStream.
	(self class specialWords includes: self header) not 
	&amp; (self class specialWords includes: ((self header findTokens: $ ) at: 1)) not 
	&amp; (self isTaggedAs: 'código') not 
	&amp; (self hasAncestorHeaderWith: '%invisible') not
		ifTrue: [    
				self headerAsMarkdownInto: markdownStream.
				self bodyAsMarkdownInto: markdownStream ].
	(self headerStartsWith: '%idea')
		ifTrue: [ self bodyAsMarkdownInto: markdownStream ].	
	(self headerStartsWith: '%item')
		ifTrue: [ self itemAsMarkdownInto: markdownStream ].
	(self headerStartsWith: '%footnote')
		ifTrue: [ self footnoteAsMarkdownInto: markdownStream ].	
	((self isTaggedAs: 'código') 
	and: [(self hasAncestorHeaderWith: '%invisible') not 
	 		&amp; (self headerStartsWith: '%embed') not ]) 
				ifTrue: [ self exportCodeNodeTo: markdownStream ].
	^ markdownStream contents
    
metadataAsYamlIn: markdownStream
	"I convert the first '%metadata' node into a YAML preamble contents to be used by Pandoc exportation."
	self metadata
		ifNil: [ markdownStream nextPutAll: String crlf. ] 
		ifNotNil: [
			self metadata
				keysAndValuesDo: [ :k :v | 
					k = 'pandocOptions'
						ifTrue: [ 
							markdownStream 
								nextPutAll: 
									(k, ': ', self pandocOptionsPrettyYaml) ]
						ifFalse: [
							markdownStream
								nextPutAll: 
									(k , ': ' , v asString) withInternetLineEndings;
									lf] ]].
		markdownStream 
			nextPutAll: String cr, String cr.

publish
	| publishedUrl |
	(self confirm: 'Publish playground content to the cloud?')
        ifFalse: [ ^ self ].
    self content ifEmpty: [ 
        self inform: 'Nothing was published because the playground is empty'.
        ^ self ].
    Clipboard clipboardText: (publishedUrl := (GTUrlProvider new post: self content) asString).
    self inform: publishedUrl , ' was published and the url was copied to clipboard'
</t>
<t tx="ekr.20190224024804.13">newNode
	node := Dictionary newFrom: { 
		#header -&gt; 'newHeadline'.
		#body -&gt; ''.
		#children -&gt; #()}.
	 ^ node.
</t>
<t tx="ekr.20190224024804.14">embedAll
	"This is just a previous part of the messy markDownContent. The %embed-all keyword should be revaluated."
	"By default a node embeds all its children. Any non-embedable content should be under a %invisible node"
	(temporalBody includesSubstring: '%embed-all')
        ifFalse: [ ]
        ifTrue: [
            self embeddedNodes do: [ :each | 
                temporalBody := temporalBody copyReplaceAll: '%embed-all' with: (each body, (String with: Character cr), 
                '%embed-all')].
            temporalBody := temporalBody copyReplaceAll: '%embed-all' with: '']

embedNodes
	"I find any ocurrence of '%embed a node header' in the body of a node and replace it"
	"by the children which have such header."
	"Using embedded nodes is useful to change the order in which children appear into parents body, while exporting"
	| temporalBody |
	temporalBody := self body.
	self embeddedNodes ifNotNil: [ self embeddedNodes do: [ :each | 
			(each isTaggedAs: 'código')
				ifFalse: [temporalBody := temporalBody copyReplaceAll: (each header) with: each body]
				ifTrue: [temporalBody := temporalBody copyReplaceAll: (each header) with: each bodyAsCode]]].
	^ temporalBody
    
embeddedNodes
	^ self children select: [:each | each headerStartsWith: '%embed']
    
headerStartsWith: aString
	^ (self header findString: aString) = 1
</t>
<t tx="ekr.20190224024804.15">cleanTreeRootReferences
	| ref |
	clipboard ifNil: [ ^ self ].
	clipboard children ifNil: [ ^ self ].
	clipboard preorderTraversal allButFirstDo: [ :n |
			ref := n.
			n level - 1 timesRepeat: [ ref := ref parent ].
			ref parent = clipboard parent ifTrue: [ ref parent: nil ]].
	clipboard parent: nil.

contentProviders
	"I list the domains of certain providers that are treated specially, because they"
	"store and offer content like Smalltalk playgrounds or source code, that can be used"
	"in particular ways while importing or exporting content in a node."
	^ Dictionary new 
	  at: 'playgrounds' put: #('ws.stfx.eu');
	  at: 'fossil' put: #('mutabit.com/repos.fossil');
	  at: 'etherpads' put: #('pad.tupale.co' );
	  yourself.

specialWords
	"I return a list of word that were used in the first versions of Grafoscopio to mark node"
	"headers to indicate special ways to handle them and their node contents."
	"Previous versions of first notebooks stored in Grafoscopio using this convention should be "
	"migrated to newer versions where tags are used for the same function with simpler code"
	^ #('%config' '%abstract' '%invisible' '%idea' '%footnote' '%metadata' '%output' '%embed' '%item').
</t>
<t tx="ekr.20190224024804.16"></t>
<t tx="ekr.20190224024804.17">Object subclass: #FileUtils
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!

!I provide some convenience functionality to work with files.!

FileUtils class
	instanceVariableNames: ''!

createFilesNamed: fileNames endingWith: fileExtension intoFolder: aFolder
	
	| createdFiles fullFileName existingFiles typedFileName |
	createdFiles := OrderedCollection new.
	existingFiles := OrderedCollection new.
	fileNames do: [ :eachFile | 
		typedFileName := eachFile, fileExtension.
		fullFileName := aFolder / typedFileName.
		fullFileName exists
			ifFalse: [ 
				fullFileName ensureCreateFile.
				createdFiles add: fullFileName basename ]
			ifTrue: [existingFiles add: fullFileName basename ]].
	^ (Dictionary new  
			at: 'created files' put: createdFiles;
			at: 'existing files' put: existingFiles;
			yourself)
</t>
<t tx="ekr.20190224024804.18">Object subclass: #FontAwesomeIcons
	instanceVariableNames: 'icons'
	classVariableNames: 'Current'
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!

tagsIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/tags.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAYAAACgu+4kAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAXRJREFUKJGN0j1Mk1EYxfH/edRFSKijH4kTJBgTJ0cGTdxE
TKyUGAfFSQcKUl3taIjIh3EUTJzaAoORwUGdmUlMXB1ktSaQGNp7HOyrgG8jZ733+d1zc69G
y9NvsC6RRbZhIxQLtkdtX5DjSW1x5hM5CdBtxGnjLUQf6IzQDSfXWu30EvTF4fdjE49GugCA
Wa8vPLuIufO3CSePRnxspzQr+3UKGnlIdGoPlMqV84ihfasdpJX8XLCch0RnZz/SJlD+p2OG
tNNcHhLA57y7dUOwl/YiKk48vCLFuuDYfyGz1Urp8pHQJNK4SUXZZqz8+GqS1w6DGL/j29fr
OnX2O6b1+9XhsIixbyX0M8Sa8Ys/AEBpqjJsa7ULYtt3JTexGoZX5070PtgHANycnL4mYuUA
YsO4TTNwHWlpsNBzv1qtpjh4TGN+9q1JRcPuntr3Av8IXAeWs2HIfn5OSlOVYayntmeON3tr
O4XtD4KNwUJPJRsG+AVxqr+5c/rf8wAAAABJRU5ErkJggg=='

copyIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/copy.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2UlEQVR4nJXQIU6DQRAF4K+F
4DAYVFHlBEgctQgScL0DCbp3wKNJOAIXQDcEC5iqQoNsA4KkiO6GJX92/p+XvGxm983bN8Mv
+rjFOnFYMNchbvCNSWooUTXopfMalxhjipfiLRucYg9bxf0zXCXBJP1yUkmwxhyviTN8wVsh
yHwsms/wiSUuivu8m3BBR1hglH5tGGxXGmGAO5zjIdBVE9xrjnb8nwQjHBb1ymaJfxAZ7NjM
HSIbHLQJIzxpzpoZYdim6WTQ7xayjmiJ7x1SLHrB4y72Www+fgBc9T/67LlhnQAAAABJRU5E
rkJggg=='

html5IconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/html5.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA+UlEQVR4nK3Tv0oDQRDH8c9J
BMFKJGIXBBtFwc7SUlDfwpewEewsbQQL8QHsA2lSiK2NCFr4Av4hjYigVSxuV/bWjRhxYJhl
9uY7v9m9rdR2ikm/tx7OoRUSO5gfA3AfFxMhPo9RDE85ICZ2Uf3gNzkgjhAVzIV4hJlC58Vc
cQ5oh7iJpb+MEBUsF+Snh/wNkI9QsqjuFe+jABu4xgDDxFcS+Ff30ggDrOEs6/6YKGgA8kOc
DfEQV+jgMoDb2bcNm0rkHqv/zOmwt4o93IX9kxIAXjTn/sBDlhviYBRgH7eFguhv6GI9LaoK
oA62sYUF9NWv70Jyff9mnwBsQJo0owsMAAAAAElFTkSuQmCC'

tagIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/tag.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAmUlEQVR4nKXPMQ4BQRSA4U9D
oeIgKsdwAUfARSSiUTmExgUcYU8gGoVGpZFIGM0WG5mxM0zyMpni/zKPP0+nvleYNN4BZyxx
yIGedfQ5L8xygIA7RhjjUYoEXNFDH7fIT+ZtQMARpy/rJJFLIorNIgasC4Ao0sW+EJn+i2xi
q+QiFQYxIAepMEzFbUhWnEKK4iayxe6XOOu8ARtNbaMQ63x5AAAAAElFTkSuQmCC'

pasteIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/paste.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAqUlEQVR4nK3TTQrBQRzG8c/I
yk6SsrAilk5hYWfjWA6hXICycwtLByDJ2upvgZrG6+BbU7+3nnnmVxNQuDDC2j09LK5xB5u4
WY7iUpLH9ZcUGaedrZ4wznWQzh0wQfjWwRB9TF33lStwwABHzFG5WfvkCfsH/Vl4MBgToriC
ZpS3sMxxkNJGkbuDO/4isPtFoIwu6km9hdUvwg2cvP8bu/BMAVXU3ly0PQOGrUCXHk1emQAA
AABJRU5ErkJggg=='

cutIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/cut.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABOUlEQVR4nNXSzyvlYRTH8Rcu
N5dmIt2FX4VpJktRUpKssB//wGSDUsrCahYzuykaGyk/YiFlb2VhYWVhYaUkKxsbTSYSYfE9
V3e+EQub+dRTz4/zvM85n+fhHXSNhxhX+IHSV+50IVNYbKAKn7EeoO8vXOyNmHFsolFMirWD
89TeFyxhEuXoxjI+ZPAVFZjHX+SRQz3uMINbTOMCoxEzinsYwlGRDw/4iX2s4VNUkcUvDD/X
Wwna0Y8WLGI7snSgGatx9o8KTn4MQB6VqA1ITuL4IP5E76dpyBQuUy0shGmHElPLI3YSs+HZ
k+4kb98QlewGMIsyfMMKOiO+B1toKgDmimC5yHqSqjIb2efRhrqAtGbQhxHJs41JXB9JAW7w
G9WYkHygY5zBQfR9jz0MpE16i2ok7v+HegQfqT9MAMiDKwAAAABJRU5ErkJggg=='

html5Icon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self html5IconContents readStream)

tagIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self tagIconContents readStream)

cutIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self cutIconContents readStream)

pasteIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self pasteIconContents readStream)

tagsIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self tagsIconContents base64Decoded readStream)

copyIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self copyIconContents readStream)
    
</t>
<t tx="ekr.20190224024804.19">Object subclass: #GfWorldMenu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GfWorldMenu commentStamp: 'OffrayLuna 2/13/2019 12:30' prior: 0!
I define the Grafoscopio main menu presented in the Pharo World.!

GfWorldMenu class
	instanceVariableNames: 'recentNotebooks'!

mainMenuItemsOn: aBuilder
	"I add the main Grafoscopio menu to the Pharo World."
	&lt;worldMenu&gt;
	
	(aBuilder item: #Grafoscopio)
		label: 'Grafoscopio';
		order: 1;
		with: [ 
			(aBuilder item: #GfLaunch; label: 'Launch') target: self.
			(aBuilder item: #GfUpdate; label: 'Update') target: self.
			(aBuilder item: #GfHelpAndDocs; label: 'Help &amp; Docs') target: self. ]

helpMenuOn: aBuilder
	&lt;worldMenu&gt;
	
	(aBuilder item: #GfManual)
		label: 'Manual';
		order: 1;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioNotebook open: GrafoscopioDocs manual ].
	(aBuilder item: #GfManualPDF)
		label: 'Manual (PDF)';
		order: 2;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioDocs openPDFManual ].
	(aBuilder item: #GfHelpDataviz)
		label: 'Dataviz';
		order: 3;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioNotebook open: DatavizDocs introNotebook ].
	(aBuilder item: #GfHelpDevNotes)
		label: 'Devs''s notes';
		order: 4;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioNotebook open: GrafoscopioDocs devNotes ].
	(aBuilder item: #GfHelpAbout)
		label: 'About Grafoscopio';
		order: 5;
		parent: #GfHelpAndDocs;
		action: [ GfUIHelpers messageAbout ].		

updateMenuOn: aBuilder
	&lt;worldMenu&gt;
	
	(aBuilder item: #GfUpdateGrafoscopio)
		label: 'Grafoscopio';
		order: 1;
		parent: #GfUpdate;
		action: [ GfUIHelpers updateGrafoscopioUI ].
	(aBuilder item: #GfUpdateDocs)
		label: 'Documentation';
		order: 2;
		parent: #GfUpdate;
		action: [ GrafoscopioDocumentation updateAllUI ].
	(aBuilder item: #GfUpdateDataviz)
		label: 'DataViz package';
		order: 3;
		parent: #GfUpdate;
		action: [ GfUIHelpers updateDatavizUI ].
	(aBuilder item: #GfUpdateAll)
		label: 'All the system';
		order: 4;
		parent: #GfUpdate;
		action: [ GfUIHelpers updateSystem ].

launchMenuOn: aBuilder
	&lt;worldMenu&gt;
	
	(aBuilder item: #'New notebook')
		label: 'New notebook';
		order: 1;
		parent: #GfLaunch;
		action: [ GrafoscopioNotebook new openDefault ].
	(aBuilder item: #'Notebook from file...')
		label: 'Notebook from file...';
		order: 2;
		parent: #GfLaunch;
		action: [ GrafoscopioNotebook new openFromFileSelector ].
	(aBuilder item: #'Notebook from the Internet...')
		label: 'Notebook from the Internet...';
		order: 3;
		parent: #GfLaunch;
		action: [ GrafoscopioNotebook new openFromUrlUI ].
	(aBuilder item: #recentNotebooks)
		label: 'Recent notebooks...';
		order: 4;
		parent: #GfLaunch;
		action: [ GfUIHelpers openFromRecentlyUsed ].	

updateRecentNotebooksWith: aFileReference
	(self recentNotebooks includes: aFileReference) 
		ifFalse: [self recentNotebooks add: aFileReference].

</t>
<t tx="ekr.20190224024804.2">Object subclass: #GrafoscopioNode
	instanceVariableNames: 'clipboard header headers key icon body tags children parent node level nodesInPreorder links output'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!

!A Node is and administrator of all node operations in a tree.!
</t>
<t tx="ekr.20190224024804.20">
ComposableModel subclass: #GrafoscopioButtonModel
	instanceVariableNames: 'button'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioButtonModel commentStamp: 'OffrayLuna 5/26/2017 10:20' prior: 0!
I'm just a prototype of how morphic buttons can be embedded
inside a Grafoscopio notebook UI via Spec.
I'm not used in the actual UI, but I'm more a remainder of directions
to explore.!


!GrafoscopioButtonModel methodsFor: 'initalize' stamp: 'johanfabry 5/12/2016 11:43'!
initializeWidgets
	button := self newButton.


!GrafoscopioButtonModel methodsFor: 'api' stamp: 'johanfabry 5/12/2016 11:49'!
content: anAssoc
	button label: anAssoc key.
	button action: anAssoc value.


!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
replace: anObject
	replace := anObject

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'johanfabry 5/12/2016 11:43'!
button: anObject
	button := anObject

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
find: anObject
	find := anObject

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
replace
	^ replace

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
ok
	^ ok

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
find
	^ find

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 8/15/2016 14:57'!
body
	^ self button

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
ok: anObject
	ok := anObject

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
cancel: anObject
	cancel := anObject

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'johanfabry 5/12/2016 11:43'!
button
	^ button

!GrafoscopioButtonModel methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:38'!
cancel
	^ cancel

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioButtonModel class
	instanceVariableNames: ''!

!GrafoscopioButtonModel class methodsFor: 'specs' stamp: 'johanfabry 5/12/2016 11:44'!
defaultSpec

	^ SpecLayout composed add: #button

</t>
<t tx="ekr.20190224024804.21">ComposableModel subclass: #GrafoscopioCodeModel
	instanceVariableNames: 'body'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioCodeModel commentStamp: 'OffrayLuna 5/26/2017 10:22' prior: 0!
I represent a Pharo code node inside a Grafoscopio notebook as a 
embedded interactive Playground.!


!GrafoscopioCodeModel methodsFor: 'accessing' stamp: 'johanfabry 4/14/2016 15:40'!
body
	^ body

!GrafoscopioCodeModel methodsFor: 'accessing' stamp: 'johanfabry 4/14/2016 15:40'!
body: anObject
	body := anObject


!GrafoscopioCodeModel methodsFor: 'as yet unclassified' stamp: 'EduardoRiesco 12/2/2017 16:49'!
extractHtmlImages
	"comment stating purpose of message"
	|imgSoup imgHost imgList src|

	imgList := Set new.
	imgSoup := Soup fromString: self body.
	(imgSoup findAllTags: 'img') do: [ :each|	
			src := (each attributeAt: 'src') asUrl.
			(src host) ifNil: [src host: self links last asUrl removeLastPathSegment].
			imgList add: src. 
			"imgList add: (each attributeAt: 'src') asUrl."
	
	  "OSProcess waitForCommand: 'wget ', (each attributeAt: 'src')."
	"imgHost := self links last removeLastPathSegment."
	
	"imgPath:= ((each attributeAt: 'src') asUrl). "
	"ZnEasy getJpeg: (imgHost , imgPath) asUrl."
	
	"OSProcess waitForCommand: ('mkdir ', imgPath)."
	
	"Transcript  show: ' wget ', imgPath , '/',(each attributeAt: 'src').	"
	]. 
	^imgList .


!GrafoscopioCodeModel methodsFor: 'API' stamp: 'johanfabry 4/14/2016 15:49'!
content: aGrafoscopioNodeContent

	body
		presentationClass: GTPlayground
		startOn: (GTPlayPage new saveContent: aGrafoscopioNodeContent)


!GrafoscopioCodeModel methodsFor: 'initialization' stamp: 'johanfabry 4/14/2016 15:48'!
initializeWidgets

	body := GlamourPresentationModel new.

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioCodeModel class
	instanceVariableNames: ''!

!GrafoscopioCodeModel class methodsFor: 'specs' stamp: 'johanfabry 4/14/2016 15:46'!
defaultSpec

	^ SpecLayout composed add: #body

</t>
<t tx="ekr.20190224024804.22">
GrafoscopioDocumentation subclass: #GrafoscopioDocs
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio'!
!GrafoscopioDocs commentStamp: 'OffrayLuna 7/4/2017 14:58' prior: 0!
I define the documentation for the Grafoscopio package.!


!GrafoscopioDocs methodsFor: 'initialization' stamp: 'OffrayLuna 11/21/2017 22:34'!
initialize
	"I model the important documents that belong to the Grafoscopio documentation.
	When more documents become more mature and usable, I will include them."

	super initialize.
	name := 'grafoscopio'. 
	repository := (FossilRepo new remote: 'http://mutabit.com/repos.fossil/grafoscopio').
	localPlace := FileLocator workingDirectory asFileReference /'Grafoscopio'.
	self 
		addDocument: 'Docs/Es/Tutoriales/tutorial.ston';
		addDocument: 'Docs/En/Books/Manual/manual.ston';
		addDocument: 'Docs/En/Books/Manual/manual.pdf';
		addDocument: 'Docs/En/Books/DataActivism/techniques-for-datactivism.ston';
		addDocument: 'Docs/En/dev-notes.ston';
		addDocument: 'Docs/En/Books/SpecIUFramework/spec-ui-framework.ston'.

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioDocs class
	instanceVariableNames: ''!

!GrafoscopioDocs class methodsFor: 'initialization' stamp: 'OffrayLuna 7/7/2017 21:24'!
initialize
	self update


!GrafoscopioDocs class methodsFor: 'operation' stamp: 'OffrayLuna 7/6/2017 13:39'!
manual
	"I'm just an alias to ease the operation. I need to know wich is the index of the notebook
	I want to open, as defined on  method."
	| docs |
	docs := self newDefault. 
	^ (docs localPlace fullName, '/', (docs documents at: 2)) asFileReference.

!GrafoscopioDocs class methodsFor: 'operation' stamp: 'OffrayLuna 12/6/2017 16:46'!
openPDFManual
	"I open the documentation in PDF format."
	| pdfManual |
	pdfManual := FileLocator imageDirectory asFileReference / 'Grafoscopio/Docs/En/Books/Manual/manual.pdf'. 
	WebBrowser openOn: pdfManual fullName.

!GrafoscopioDocs class methodsFor: 'operation' stamp: 'OffrayLuna 7/6/2017 13:39'!
devNotes
	"I'm just an alias to ease the operation. I need to know wich is the index of the notebook
	I want to return, as defined on instance initialize method"
	| docs |
	docs := self newDefault. 
	^ (docs localPlace fullName, '/', (docs documents at: 3)) asFileReference.

!GrafoscopioDocs class methodsFor: 'operation' stamp: 'OffrayLuna 7/6/2017 13:39'!
tutorial
	"I'm just an alias to ease the operation. I need to know wich is the index of the notebook
	I want to return, as defined on instance initialize method"
	| docs |
	docs := self newDefault. 
	^ (docs localPlace fullName, '/', (docs documents at: 1)) asFileReference.

</t>
<t tx="ekr.20190224024804.23">
ComposableModel subclass: #GrafoscopioLinksList
	instanceVariableNames: 'links'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioLinksList commentStamp: 'OffrayLuna 1/3/2019 22:11' prior: 0!
I model the links of a GrafoscopioNode.

I'm responsable for showing the links and selecting them.!


!GrafoscopioLinksList methodsFor: 'accessing' stamp: 'OffrayLuna 1/3/2019 22:16'!
links
	^ links

!GrafoscopioLinksList methodsFor: 'accessing' stamp: 'OffrayLuna 1/3/2019 22:24'!
content: aGrafoscopioNode
	links items: aGrafoscopioNode links

!GrafoscopioLinksList methodsFor: 'accessing' stamp: 'OffrayLuna 1/3/2019 22:16'!
links: anObject
	links := anObject


!GrafoscopioLinksList methodsFor: 'api' stamp: 'OffrayLuna 1/3/2019 22:34'!
title
	^ 'Node links list'


!GrafoscopioLinksList methodsFor: 'initialization' stamp: 'OffrayLuna 1/3/2019 22:29'!
initializeWidgets
	links := self newList.
	self focusOrder add: links


!GrafoscopioLinksList methodsFor: 'api-events' stamp: 'OffrayLuna 1/3/2019 22:40'!
whenSelectedItemChanged: aBlock
	links whenSelectedItemChanged: aBlock

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioLinksList class
	instanceVariableNames: ''!

!GrafoscopioLinksList class methodsFor: 'specs' stamp: 'OffrayLuna 1/3/2019 22:38'!
defaultSpec
	^ SpecLayout composed
		add: #links;
		yourself 

</t>
<t tx="ekr.20190224024804.24">ComposableModel subclass: #GrafoscopioLinkstModel
	instanceVariableNames: 'links'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
</t>
<t tx="ekr.20190224024804.25">TestCase subclass: #GrafoscopioNodeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!I test the main functionality of the GrafoscopioNode class.!

testRemoveLeadingLineNumbersSized
	| copiedCode testNode |
	copiedCode := '
 1var tree = d3.layout.tree()
 2    .sort(null)
 3    .size([size.height, size.width - maxLabelLength*options.fontSize])
 4    .children(function(d)
 5    {
 6        return (!!d.contents || d.contents.length === 0) ? null : d.contents;
 7    });
 8
 9var nodes = tree.nodes(treeData);
10var links = tree.links(nodes);
11  '.
	testNode := GrafoscopioNode new
		body: copiedCode.
	testNode removeLeadingLineNumbersSized: 3.
	self assert: testNode body equals: '
var tree = d3.layout.tree()
    .sort(null)
    .size([size.height, size.width - maxLabelLength*options.fontSize])
    .children(function(d)
    {
        return (!!d.contents || d.contents.length === 0) ? null : d.contents;
    });

var nodes = tree.nodes(treeData);
var links = tree.links(nodes);
  
'

testInitializeIsOk
	self shouldnt: [ GrafoscopioNode new ] raise: Error 

dummyHtml
	| txt |
	txt := '&lt;html&gt; &lt;body&gt; &lt;img src="/web/files/pharo-logo-small.png"&gt;
			&lt;img src="https://pharo.org/web/files/pharo.png"&gt;
			&lt;/body&gt;&lt;/html&gt;'.
	^ txt

testAddingChildren
	| tree nnode orig | 
	tree := GrafoscopioNode new becomeDefaultTestTree.
	nnode := GrafoscopioNode new.
	orig := tree children size.
	tree addNode: nnode.
	self assert: tree children size equals: orig + 1.

testDemoteNode
	| tree child1 child2 | 
	tree := GrafoscopioNode new.
	child1 := GrafoscopioNode new.
	child2 := GrafoscopioNode new.
	tree 
		addNode: child1;
		addNode: child2.
	child2 demote.
	self assert: child2 level equals: child1 level + 1
	
testHasMarkdownSubtreesToExport
	"Because becomeDefaultTestTree contains at least one non empty 'links' object that
	points to a relative path in the file system, ending in '.md' or '.markdown' the
	result of this test is true.
	Please see look #becomeDefaultTestTree message to see the details that makes this test true."
	| tree | 
	tree := GrafoscopioNode new becomeDefaultTestTree.
	self assert: tree selectMarkdownSubtreesToExport isNotEmpty equals: true.
	
testPromoteNode
	| tree child1 child2 | 
	tree := GrafoscopioNode new.
	child1 := GrafoscopioNode new.
	child2 := GrafoscopioNode new.
	tree addNode: child1.
	child1 addNode: child2.
	child2 promote.
	self assert: child2 level equals: child1 level

testRemovingChildren
	| tree orig | 
	tree := GrafoscopioNode new becomeDefaultTestTree.
	orig := tree children size.
	orig &gt; 0 ifTrue: [ tree removeNode: (tree children at: 1) ].
	self assert: tree children size equals: orig - 1.

testFindAndReplace
	| tree | 
	tree := GrafoscopioNode new.
	tree body: 'I''m only a test node.'.
	tree find: 'only' andReplaceWith: 'JUST'.
	self assert: (tree body findString: 'JUST') &gt; 0.
</t>
<t tx="ekr.20190224024804.26">ComposableModel subclass: #GrafoscopioNotebook
	instanceVariableNames: 'tree header body links windowMainMenu workingFile notebook debugMessage imagesList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioNotebook commentStamp: 'johanfabry 5/12/2016 11:13' prior: 0!
I am a Grafoscopio Notebook.

Example:
| testTree nb |
testTree := GrafoscopioNode new becomeDefaultTestTree.
nb := GrafoscopioNotebook new.
nb notebookContent: testTree.
nb openWithSpec !


!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 9/17/2017 13:57'!
findAndReplace
	| currentNode replaceGUI findString replaceString |
	currentNode := tree highlightedItem content.
	replaceGUI := GrafoscopioReplace new.
	replaceGUI openWithSpec.
	replaceGUI ok
		on: [  ] 
		do: [ 
			findString := replaceGUI returnValues at: 'find'.
			replaceString := replaceGUI returnValues at: 'replace'.
			currentNode find: findString andReplaceWith: replaceString. ]
	

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 1/4/2019 19:18'!
linksList
	| currentNode |
	currentNode := tree highlightedItem content.
	GrafoscopioLinksList new
		content: currentNode;
		openWithSpec
	

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/6/2017 19:07'!
importImages
	self imagesList: (Pandoc listImagesFrom: self markdownFile).
	self inform: 'All notebook images has been imported.', String cr, 'Now you can list and download them.'

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 10/4/2018 08:03'!
downloadImages
	"I download all images in a notebook into a local folder that respects relative paths.
	So if a image refers to http://mysite.com/uploads/chap1/myimage.png, it will be stored
	into: 'uploads/chap1/myimage.png' in the same folder where the notebook is stored.
	This is helpful for notebooks conversions that expect to have local images in particular
	locations."

	| parentFolder |
	parentFolder := self workingFile parent.
	self.
	^ self imagesList do: [ :each | | relativePathString link |
		link := each contents asUrl.
		relativePathString := link directory.
		relativePathString ifNotEmpty: [ 
			GrafoscopioUtils ensureCreateDirectory: relativePathString into: parentFolder ]]

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 1/4/2019 17:34'!
wrapBodyLines
	self currentNodeContent wrapBodyLines.
	self updateBodyFor: self currentNode


!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 8/27/2017 13:58'!
htmlToMarkdownSubtree
	self currentNodeContent htmlToMarkdownSubtree.
	self updateBodyFor: self currentNode

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 12/19/2016 12:42'!
updateBodyFor: aNodeContainer
	| aNode |
	self needRebuild: false.
	tree needRebuild: false.
	body needRebuild: true.
	aNode := aNodeContainer content.
	header text: aNode header.
	body := self instantiate: aNode specModelClass new.
	body content: aNode body.
	links text: aNode lastLink.
	self autoSaveBodyOf: aNode.
	self buildWithSpecLayout: self class defaultSpec

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 12/19/2016 13:43'!
visitNodeLink
	
	tree highlightedItem content visitLastLink.

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 8/3/2017 20:03'!
importLinkContent
	"I see if a node header is an url located at 'http://ws.stfx.eu', wich means that is a shared
	workspace, and convert the node body to an interactive playground"
	| currentNode nodeContent |
	currentNode := tree highlightedItem.
	currentNode ifNil: [ ^ self ].
	nodeContent := currentNode content.
	nodeContent importPlaygroundLink.
	nodeContent importHtmlLink.
	self updateBodyFor: currentNode

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 12/6/2017 17:12'!
htmlToMarkdown
	self currentNodeContent htmlToMarkdown.
	self updateBodyFor: self currentNode

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 5/3/2017 11:11'!
debugWithSelector: aSymbol
	"I invoke a message to debug in the current node. In the future the debugging scope can be changed to
	include different elements instead of the current node."
	| currentNode nodeContent |
	currentNode := tree highlightedItem.
	currentNode ifNil: [ ^ self ].
	nodeContent := currentNode content.
	^ (nodeContent perform: aSymbol asSymbol) inspect

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 8/27/2017 13:55'!
currentNodeContent
	^ self currentNode content

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 8/27/2017 13:55'!
currentNode
	| currentNode |
	currentNode := tree highlightedItem.
	currentNode ifNil: [ ^ self ].
	^ currentNode

!GrafoscopioNotebook methodsFor: 'operation' stamp: 'OffrayLuna 11/28/2017 14:16'!
autoSaveBodyOf: aNode
	| playground |
	body body class = TextModel
		ifTrue: [ body body whenTextChanged: [ :arg | aNode body: arg ] ].
	body body class = GlamourPresentationModel
		ifFalse: [ ^ self ].
	playground := body body glmPres.
	playground
		onChangeOfPort: #text
			act: [ :x | aNode body: (x pane port: #text) value ]";		
		onChangeOfPort: #activePresentation
			act: [ aNode output: aNode processOutput ]"


!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 12/19/2016 11:57'!
links
	^ links

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 5/24/2016 14:27'!
workingFile
	^ workingFile

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 5/25/2016 16:01'!
notebook
	^ notebook

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 4/14/2016 11:27'!
tree
	^ tree

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 12/2/2017 19:14'!
imagesList: anObject
	imagesList := anObject

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'johanfabry 4/14/2016 15:53'!
header
	^ header

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'johanfabry 4/14/2016 15:53'!
header: anObject
	header := anObject

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'johanfabry 4/14/2016 15:14'!
body
	^ body

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 12/19/2016 11:57'!
links: anObject
	links := anObject

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 5/1/2017 13:01'!
debugMessage: aGrafoscopioNodeSelector
	"I define a message that can be used for debugging purposes in the current notebook."
	debugMessage := aGrafoscopioNodeSelector

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'johanfabry 5/12/2016 11:30'!
windowMainMenu: anObject
	windowMainMenu := anObject

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 5/3/2017 11:05'!
debugMessage
	^ debugMessage ifNil: [ self defineDebugMessageUI ]

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 4/14/2016 11:27'!
tree: anObject
	tree := anObject

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'johanfabry 5/12/2016 11:31'!
windowMainMenu
	^ windowMainMenu

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 12/2/2017 21:00'!
imagesList
	imagesList ifNil: [ ^ #('No images list for this notebook') ].
	^ imagesList

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 5/25/2016 16:01'!
notebook: anObject
	notebook := anObject

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'OffrayLuna 8/17/2017 16:09'!
workingFile: aFileReference
	workingFile := aFileReference.

!GrafoscopioNotebook methodsFor: 'accessing' stamp: 'johanfabry 4/14/2016 15:14'!
body: anObject
	body := anObject


!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 2/1/2017 13:06'!
markdownFile
	"I define the location of the markdown file where the notebook will be exported"
	| markdownFile |
	markdownFile := (((workingFile parent) / workingFile basenameWithoutExtension) fullName, '.markdown') asFileReference.
	^ markdownFile 

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 7/31/2017 11:22'!
openDefault
"I open a new default notebook"

	^ self class new openWithSpec.

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 4/4/2017 09:26'!
subtreeAsMarkdown
	| currentNode |
	currentNode := tree highlightedItem content.
	self inform: ('Exported as: ', String cr, (self subtreeAsMarkdownFor: currentNode) fullName )

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 4/4/2017 11:43'!
exportAllSubtreesAsMarkdow
	| toBeExported |
	toBeExported := self notebook selectMarkdownSubtreesToExport.
	toBeExported ifEmpty: [ ^ self ].
	toBeExported do: [ :each | self subtreeAsMarkdownFor: each ].
	self inform: toBeExported size asString , ' exported markdown subtrees.'

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 2/18/2019 22:27'!
openFromFileSelector
	
	| file nb |
	file := UIManager default 
						chooseExistingFileReference:'Choose a file'
						extensions: #('ston')
						path: FileLocator documents.
	file ifNil: [
		self inform: 'No file selected'.
		^ self ].
	self workingFile: file.
	nb := self class new.
	nb openFromFile: self workingFile.
	GfUIHelpers updateRecentNotebooksWith: workingFile

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 12/1/2017 15:19'!
exportNode: aGrafoscopioNode asMarkdownIn: aFile
	"I export the current tree/document to a markdown file"
	aFile ensureDelete.
	aFile 
		ensureCreateFile;
		writeStreamDo: [:stream | 
			stream 
				nextPutAll: 
					('---', String cr,
					'exportedFrom: ', self checksum, String cr) withInternetLineEndings.
			aGrafoscopioNode metadataAsYamlIn: stream.
			stream 
				nextPutAll: 
					('---', String cr, String cr) withInternetLineEndings,
					aGrafoscopioNode asMarkdown ].
		self inform: 'Exported as: ', String cr, aFile fullName

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 11/21/2017 22:14'!
loadFromFile: aFileReference
	"I load the contents of aFileReference into a GrafoscopioNotebook, without opening it."
	(aFileReference basename endsWith: 'ston') ifFalse: [ ^ self ].
	self workingFile: aFileReference.
	self notebook: ((STON fromString: self workingFile contents) at: 1) parent.
	self title: self workingFile basenameWithIndicator, ' | Grafoscopio notebook'.
	self notebookContent: self notebook.

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 12/6/2017 16:11'!
exportAsPDF
	"I export the current tree/document to a PDF file, using pandoc and LaTeX external apps.
	The latex engine used is xelatex, to minimize errors and warnings related with UTF8 support.
	I suppose all them are already installed and defined in the system."
	| pandocCommonCommand  |
	self markdownFile exists ifFalse: [ self exportAsMarkdown ].	
	self pdfFile ensureDelete.
	pandocCommonCommand := 'pandoc ', self pandocOptionsComputed, ' ', self markdownFile fullName, 
		' --output ', self pdfFile fullName.
	Smalltalk platformName = 'unix' 
		ifTrue: [ ExternalOSProcess command: 'cd ', self markdownFile parent fullName,'; ', pandocCommonCommand ].
	Smalltalk platformName = 'Win32' 
		ifTrue: [ WinProcess createProcess: pandocCommonCommand ].
	self inform: ('File exported as: ', String cr, self pdfFile fullName)

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 8/10/2017 11:54'!
openFromUrl: url
"Opens a tree from a file named aFileName"

	| fileName sanitized |
	sanitized := GrafoscopioUtils sanitize: url.
	fileName := sanitized segments last.
	GrafoscopioUtils
		downloadingFrom: sanitized 
		withMessage:  'Downloading document...'
		into: FileLocator temp.
	self class new openFromFile: (FileLocator temp / fileName)

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 8/18/2017 12:59'!
pdfFile
	"I define the location of the markdown file where the notebook will be exported"
	| pdfFile |
	pdfFile := (self markdownFile parent fullName,'/', self markdownFile basenameWithoutExtension, '.pdf') asFileReference.
	^ pdfFile.
	

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 5/26/2017 10:05'!
exportAsSton: aNotebook on: aFileStream
	aNotebook flatten.
    (STON writer on: aFileStream)
		newLine: String crlf;	
      	prettyPrint: true;
		keepNewLines: true;
      	nextPut: aNotebook children

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 2/14/2019 12:36'!
saveWorkingNotebook
	"Saves the current tree to the user predefined file location used when he/she opened it."
	self workingFile 
		ifNil: [ self saveToFileUI ] 
		ifNotNil: [ self saveToFile: workingFile ].
	GfUIHelpers updateRecentNotebooksWith: workingFile
	
	

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 4/5/2017 19:44'!
openFromUrlUI
	"This method generates the UI for the openFromUrl: method, it asks for a URL from the user"

	| fileUrl |
	"GrafoscopioBrowser configureSettings."
	fileUrl := UIManager default 
							textEntry: 'Enter the URL' 
							title: 'Open notebook from URL'.						
	fileUrl isNil ifTrue: [ ^nil ].
	self class new openFromUrl: fileUrl

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 3/28/2017 22:00'!
exportAsMarkdown
	"I export the current working  tree/document to a markdown file."
	workingFile
		ifNil: [ self inform: 'File NOT exported. Please save the notebook on hard drive first' ]
		ifNotNil: [ self exportNode: (self notebook)  asMarkdownIn: (self markdownFile) ]

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 2/14/2019 12:36'!
saveToFile: aFileReference
	"I save the current tree/document to a file."

	aFileReference ifNil: [ self inform: 'No file selected for saving. Save NOT done.'. ^ self ].
	workingFile := aFileReference.
	self workingFile ensureDelete.
	self workingFile writeStreamDo: [:stream | 
		self exportAsSton: self notebook on: stream ].
	self title: self workingFile basenameWithIndicator, ' | Grafoscopio notebook'.
	self inform: ('File saved at: ', String cr, self workingFile fullName).
	GfUIHelpers updateRecentNotebooksWith: aFileReference.

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 4/4/2017 08:53'!
subtreeAsMarkdownFor: aNode
	| exportedFile |
	aNode links ifEmpty: [ ^ self ].
	exportedFile:= self navigateRelativePathFor: aNode links last.
	exportedFile class = GrafoscopioNotebook  ifTrue: [ ^ self ].
	self exportNode: aNode  asMarkdownIn: exportedFile.
	^ exportedFile 

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 2/18/2019 16:14'!
saveToFileUI

	| file |
	
	file := UIManager default
		chooseForSaveFileReference: 'Export notebook to file as...'
		extensions: #('ston')
		path: (workingFile ifNotNil: [ workingFile parent ] ifNil: [ FileLocator documents ]  ).
	file 
		ifNil: [ self inform: 'Export cancelled'. ^ self ] 
		ifNotNil:[self saveToFile: file].

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 2/13/2018 21:29'!
exportAsHTML
	"I export the current tree/document to a HTML file, using pandoc external app.
	I suppose pandoc is already installed and available in the system."
	| htmlFile |
	self markdownFile exists ifTrue: [ self markdownFile delete ].
	self exportAsMarkdown.
	htmlFile := self markdownFile parent fullName,'/', self markdownFile basenameWithoutExtension, '.html'.
	htmlFile asFileReference exists ifTrue: [ htmlFile asFileReference delete ].
	Smalltalk platformName = 'unix' 
		ifTrue: [
			OSSUnixSubprocess new 
				command: 'pandoc'; 
				arguments: {'--standalone'. self markdownFile fullName. '--output' . htmlFile};
				redirectStdout;
				runAndWaitOnExitDo: [ :process :outString :errString |
					process isSuccess 
						ifTrue: [ self inform: ('File exported as: ', String cr, htmlFile) ]
						ifFalse: [ self inform: 'Exportation unsuccesful. Please review that you have
							installed Pandoc and have used the exportation options properly.' ]]].
	Smalltalk platformName = 'Win32' 
		ifTrue: [WinProcess createProcess: 'pandoc --standalone ', self markdownFile fullName, ' -o ', htmlFile].

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 8/18/2017 13:29'!
exportAsLaTeX
	"I export the current tree/document to a LaTeX file, using pandoc external app.
	I suppose pandoc is already installed and available in the system."
	| texFile |
	self markdownFile exists ifTrue: [ self markdownFile delete ].
	"self exportAsMarkdown.""&lt;- This violates the separation of concenrs. Markdown exportation should
	be explicit. There is still the issue of how to deal with desynchronization between a notebook 
	which has unsaved changes as markdown.... TO BE REVIWED!!"
	texFile := self markdownFile parent fullName,'/', self markdownFile basenameWithoutExtension, '.tex'.
	texFile asFileReference exists ifTrue: [ texFile asFileReference delete ].
	OSProcess command: 'pandoc --standalone ', self markdownFile fullName, ' -o ', texFile.
	self inform: ('File exported as: ', String cr, texFile).

!GrafoscopioNotebook methodsFor: 'persistence' stamp: 'OffrayLuna 8/17/2017 16:08'!
openFromFile: aFileReference
							
	self loadFromFile: aFileReference.
	^ self openWithSpec.


!GrafoscopioNotebook methodsFor: 'api' stamp: 'OffrayLuna 8/12/2016 12:10'!
notebookContent: aTree

	| nodeBlock |
	nodeBlock:= [:gfcNode | |node|
    	node := TreeNodeModel new.
    	node 
		hasChildren: [ gfcNode children isNotEmpty ];
    		children: [ gfcNode children collect: [:subNode | nodeBlock value: subNode ]];
     		content: gfcNode].
	tree roots: (aTree children collect:[ :gfcNode | nodeBlock value: gfcNode])
	

!GrafoscopioNotebook methodsFor: 'api' stamp: 'OffrayLuna 8/19/2016 10:16'!
extent
	^900@500


!GrafoscopioNotebook methodsFor: 'private' stamp: 'OffrayLuna 1/22/2017 19:37'!
okToChange
	^ true


!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'AutoDeprecationRefactoring 2/13/2019 12:56'!
notebookSubMenu
	^ MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Save';
						icon: (Smalltalk ui icons iconNamed: #smallSave);
						shortcut: $s command;
						action: [ self saveWorkingNotebook ] ].
			group
				addItem: [ :item | 
					item
						name: 'Save as...';
						icon: (Smalltalk ui icons iconNamed: #smallSaveAs);
						action: [ self saveToFileUI ] ].
			group
				addItem: [ :item | 
					item
						name: 'Import images';
						icon: (Smalltalk ui icons iconNamed: #processBrowser);
						action: [ self importImages ] ].
			group
				addItem: [ :item | 
					item
						name: 'See images list';
						icon: (Smalltalk ui icons iconNamed: #processBrowser);
						action: [ self listImagesUI ] ].
			group
				addItem: [ :item | 
					item
						name: 'Download images';
						icon: (Smalltalk ui icons iconNamed: #processBrowser);
						action: [ self downloadImages ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as markdown';
						icon: (Smalltalk ui icons iconNamed: #smallSaveAs);
						action: [ self exportAsMarkdown ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as html';
						icon: (Smalltalk ui icons iconNamed: #smallWindow);
						action: [ self exportAsHTML ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as LaTeX';
						icon: (Smalltalk ui icons iconNamed: #smallPrint);
						action: [ self exportAsLaTeX ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as pdf';
						icon: (Smalltalk ui icons iconNamed: #smallPrint);
						action: [ self exportAsPDF ] ].
			group
				addItem: [ :item | 
					item
						name: 'See html';
						icon:
							(self iconNamed: #smallInspectIt);
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: 'See pdf';
						icon: (Smalltalk ui icons iconNamed: #smallInspectIt);
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: 'Define debug message...';
						icon: Smalltalk ui icons glamorousBug;
						action: [ self defineDebugMessageUI ] ] ]

!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'OffrayLuna 8/26/2017 20:04'!
initializeDefaultTest
	super initialize.
	self
		notebook: (GrafoscopioNode new becomeDefaultTestTree);
		title: ' New test | Grafoscopio notebook'.
	self notebookContent: self notebook.


!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'OffrayLuna 8/5/2017 18:47'!
initializePresenter
	tree whenHighlightedItemChanged: [ :item | 
		tree highlightedItem ifNotNil: [self updateBodyFor: item]].
	tree whenTreeUpdated: [ :item | item ifNotNil: [self updateBodyFor: item]].
	header whenTextChanged: [ :arg |
		(tree highlightedItem content header) = arg
			ifFalse: [ 
				tree highlightedItem content header: arg.
				tree roots: tree roots]].
	links whenTextChanged: [ :arg | tree highlightedItem content addLink: arg ]

!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'OffrayLuna 7/31/2017 11:19'!
initialize	
	super initialize.
	self
		notebook: (GrafoscopioNode new becomeDefaultTree);
		title: ' New | Grafoscopio notebook'.
	self notebookContent: self notebook.


!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'OffrayLuna 7/19/2016 14:23'!
projectSubMenu
	
	^ MenuModel new
		addGroup: [ :group |
			group addItem: [ :item |
				item 
					name: 'Activate remote repository...';
					icon: Smalltalk ui icons smallPushpinIcon;
					action: [ self inform: 'To be implemented ...' ] ].
						group addItem: [ :item |
				item 
					name: 'Activate local repository...';
					icon: Smalltalk ui icons homeIcon;
					action: [ self inform: 'To be implemented ...' ] ].	
			group addItem: [ :item |
				item 
					name: 'Add file...';
					icon: Smalltalk ui icons newerPackagesAvailableIcon;
					action: [ self inform: 'To be implemented ...' ] ].
			group addItem: [ :item |
				item 
					name: 'Delete file...';
					icon: Smalltalk ui icons packageDeleteIcon;
					action: [ self inform: 'To be implemented ...' ] ].
			group addItem: [ :item |
				item 
					name: 'Commit to repository';
					icon: Smalltalk ui icons smallScreenshotIcon;
					action: [ self inform: 'To be implemented ...' ] ]. 
			group addItem: [ :item |
				item 
					name: 'Credentials';
					icon: Smalltalk ui icons userIcon;
					action: [ self inform: 'To be implemented ...' ] ]	]
	

!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'OffrayLuna 3/27/2017 13:49'!
initializeWidgets
	windowMainMenu := self topBar.
	header := self newTextInput.
	header autoAccept: true.
	body := self newText.
	body disable.
	body text: '&lt;- Select a node'.
	links := self newTextInput.
	tree := TreeModel new.
	tree 
		childrenBlock: [:node | node children];
		displayBlock: [:node | node title ].
	self focusOrder 
		add: tree;
		add: header;
		add: body;
		add: links.
	self askOkToClose: true.

!GrafoscopioNotebook methodsFor: 'initialization' stamp: 'AutoDeprecationRefactoring 2/13/2019 13:34'!
topBar
	^ MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Notebook';
						icon: (self iconNamed: #smallObjects);
						subMenu: self notebookSubMenu ].
			group
				addItem: [ :item | 
					item
						name: 'Project';
						icon: (self iconNamed: #catalog);
						subMenu: self projectSubMenu ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Save notebook';
						icon: (self iconNamed: #glamorousSave);
						action: [ self saveWorkingNotebook ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Export all markdown subtrees';
						icon: (self iconNamed: #glamorousMore);
						action: [ self exportAllSubtreesAsMarkdow ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Cut';
						icon: (self iconNamed: #smallCut);
						action: [ self cutNodeToClipboard ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Copy';
						icon: (self iconNamed: #smallCopy);
						action: [ self copyNodeToClipboard ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Paste';
						icon: (self iconNamed: #smallPaste);
						action: [ self pasteNodeFromClipboard ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Find &amp; Replace';
						icon: (self iconNamed: #smallFind);
						action: [ self findAndReplace ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Add node';
						icon: MendaIcons new plusIcon;
						action: [ self addNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Delete node';
						icon: MendaIcons new minusIcon;
						action: [ self removeNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node up';
						icon: MendaIcons new arrowUpIcon;
						action: [ self moveNodeBefore ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node down';
						icon: MendaIcons new arrowDownIcon;
						action: [ self moveNodeAfter ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node left';
						icon: MendaIcons new arrowLeftIcon;
						action: [ self promoteNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node right';
						icon: MendaIcons new arrowRightIcon;
						action: [ self demoteNode ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Toggle: code &lt;--&gt; text';
						icon: MendaIcons new smalltalkCodeIcon;
						action: [ self toggleCodeNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'List node links';
						icon: (self iconNamed: #tinyMenu);
						action: [ self linksList ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Visit link';
						icon: (self iconNamed: #glamorousRight);
						action: [ self visitNodeLink ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Import link content';
						icon: (self iconNamed: #glamorousRefresh);
						action: [ self importLinkContent ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'HTML to Markdown';
						icon: (self iconNamed: #smallProfile);
						action: [ self htmlToMarkdown ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'HTML to Markdown subtree';
						icon: (self iconNamed: #hierarchy);
						action: [ self htmlToMarkdownSubtree ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Tag as...';
						icon: MendaIcons new tagAddIcon;
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Untag ....';
						icon: MendaIcons new tagMinusIcon;
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Edit tags...';
						icon: FontAwesomeIcons new tagsIcon;
						action: [ self inform: 'To be implemented...' ] ] ];
		addGroup: [ :debug | 
			debug
				addItem: [ :item | 
					item
						name: nil;
						description: 'Debug';
						icon:
							(self iconNamed: #glamorousBug);
						action: [ self debugWithSelector: self debugMessage ] ] ]


!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 11/21/2017 10:00'!
metadata
	^ self notebook metadata

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 8/18/2017 00:11'!
pandocOptions
	^ self notebook pandocOptions

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 5/3/2017 11:00'!
defineDebugMessageUI
	| answer |
	answer := UIManager default 
		request: 'Define debug message to be send to a selected node in this notebook.' 
		initialAnswer: 'messageNoDebugSelector'.
	self debugMessage: answer 

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 8/18/2017 19:59'!
addCommandFrom: dictionary into: stream
	dictionary keysAndValuesDo: [ :k :v |
		k = 'thisNotebook' 
			ifTrue: [ 
				stream nextPutAll: (GrafoscopioUtils perform: v on: self) ]]

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 4/4/2017 10:17'!
navigateRelativePathFor: aFileString
	"Given a relative path according to location of the notebook's workingFile, 
	I navigate to that file if exist and create it, including subdirectories if it does not exist.
	If the relative path is located in a subdirectory that shares the route with the notebooks working
	file, it must start with the folders name,
	without using './' to point the same shared root "

	| finalLocation pathSegments  |
	aFileString ifEmpty: [ ^ self ].
	aFileString asUrl host ifNotNil: [ ^self ].
	finalLocation := workingFile parent.
	pathSegments := aFileString splitOn: '/'.
	pathSegments allButLastDo: [ :segment | 
		(segment = '..') 
			ifTrue: [ finalLocation := finalLocation parent ]
			ifFalse: [
				finalLocation := finalLocation / segment.
				finalLocation exists ifFalse: [ finalLocation ensureCreateDirectory ]]].
	finalLocation := finalLocation / (pathSegments last).
	finalLocation exists ifFalse: [ finalLocation ensureCreateFile ].
	^ finalLocation

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 8/17/2017 16:07'!
markdownFileChecksum
	self workingFile ifNil: [ ^ self ].
	self workingFile contents = '' ifTrue: [ ^ self ]. 
	^ GrafoscopioUtils checksumFor: self markdownFile

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 12/11/2017 16:07'!
pandocOptionsComputed
	"I convert the pandoc options array into a single line that can be used with the pandoc command."

	| result |
	result := '' writeStream.
	self pandocOptions ifNil: [ ^ '' ].
	self pandocOptions
		do: [ :option |
			option isDictionary 
				ifTrue: [ 
					self addCommandFrom: option into: result  ]
				ifFalse: [
					result
						nextPutAll: option] ].
	^ result contents

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 1/4/2019 19:18'!
listImagesUI
	ListModel new
		title: 'Images files list';
		items: self imagesList ;
		openWithSpec

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 8/17/2017 16:09'!
checksum
	"I return the checksum (crypto hash) of the workingFile where this notebook is being stored.
	I'm useful for data provenance and traceability of derivated files coming from this source
	notebook."
	self workingFile ifNil: [ ^ self ].
	self workingFile contents = '' ifTrue: [ ^ self ]. 
	^ GrafoscopioUtils checksumFor: self workingFile

!GrafoscopioNotebook methodsFor: 'utilities' stamp: 'OffrayLuna 8/18/2017 19:36'!
markdownFileChecksumUpto: anInteger
	"I cut the markdownFileCheckup upto a given integer. 
	Type coersion is needed, because this message argument can be read from a string in %metadata nodes.
	Maybe the way used by playgrounds to import text as commands can be useful here."
	^ self markdownFileChecksum copyFrom: 1 to: anInteger asInteger.


!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 12/17/2016 18:57'!
cutNodeToClipboard
	self copyNodeToClipboard; removeNode.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:13'!
demoteNode
	| editedNode |
	editedNode := tree highlightedItem content.
	editedNode demote.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 12/17/2016 18:49'!
copyNodeToClipboard
	tree highlightedItem content copyToClipboard.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 8/28/2017 14:01'!
addNode
	self currentNodeContent addNodeAfterMe.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:14'!
promoteNode
	| editedNote |
	editedNote := tree selectedItem content.
	editedNote promote.
	self notebookContent: notebook

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 12/17/2016 18:49'!
pasteNodeFromClipboard
	tree highlightedItem content pasteFromClipboard.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:20'!
moveNodeBefore
	| editedNode |
	editedNode := tree highlightedItem content.
	editedNode moveBefore.
	self notebookContent: notebook

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 8/4/2017 11:45'!
toggleCodeNode
	| currentNode |
	currentNode := tree highlightedItem.
	currentNode content toggleCodeText.
	self updateBodyFor: currentNode.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:20'!
removeNode
	| contentToDelete parentContent newSelectedContent children |
	contentToDelete := tree selectedItem content.
	parentContent := contentToDelete parent.
	children := parentContent children.
	children size &gt; 1 
		ifTrue: [ 
			children last = contentToDelete 
				ifTrue: [ newSelectedContent := children at: (children size - 1) ]
		]
		ifFalse: [ newSelectedContent := parentContent ].
	contentToDelete parent removeNode: contentToDelete.
	self notebookContent: notebook

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:19'!
moveNodeAfter
	| editedNode |
	editedNode := tree selectedItem content.
	editedNode moveAfter.
	self notebookContent: notebook

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioNotebook class
	instanceVariableNames: ''!

!GrafoscopioNotebook class methodsFor: 'instance creation' stamp: 'OffrayLuna 7/6/2017 18:10'!
open: aFileReference
	self newDefault openFromFile: aFileReference 

!GrafoscopioNotebook class methodsFor: 'instance creation' stamp: 'OffrayLuna 7/6/2017 18:09'!
newDefault
	^ self new.


!GrafoscopioNotebook class methodsFor: 'utility' stamp: 'OffrayLuna 5/13/2016 15:05'!
SHA1For: aFile is: aSHA1String 
	"I verify that a file has the same signature that the one in a given string,
	returning true in that case or false otherwise"
 	^ (SHA1 new hashMessage: aFile asFileReference binaryReadStream contents) hex = aSHA1String
	


!GrafoscopioNotebook class methodsFor: 'specs' stamp: 'OffrayLuna 7/4/2017 17:47'!
defaultSpec

	^ SpecLayout composed
		newColumn: [:tcol|
			tcol newRow: [ :wrow | wrow add: #windowMainMenu ] height: (self toolbarHeight);
					newRow: [:row |
						row newColumn: [ :tc |
							tc add: #tree
								] width: 300.
						row newColumn: [ :bc |
							bc newRow: [ :bcr | bcr add: #header ] height: self toolbarHeight.
							bc add: #body; add: #links height: self toolbarHeight ]]]
</t>
<t tx="ekr.20190224024804.27">
TestCase subclass: #GrafoscopioNotebookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioNotebookTest commentStamp: 'OffrayLuna 5/8/2017 10:05' prior: 0!
I test the main functionality of the GrafoscopioNode class.!

</t>
<t tx="ekr.20190224024804.28">
ComposableModel subclass: #GrafoscopioReplace
	instanceVariableNames: 'find replace ok cancel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioReplace commentStamp: 'OffrayLuna 9/9/2017 19:40' prior: 0!
I'm a tool for finding and replacing text ocurrences in notebook
nodes. !

!GrafoscopioReplace methodsFor: 'initialization' stamp: 'OffrayLuna 9/17/2017 13:37'!
initializePresenter
	"Here we need to deal with changes in the OK button to send messages about the
	state of the 'find' and 'replace' variables or do nothing if 'Cancel' is pressed."
	ok whenStateChangedDo: [ 
			Transcript show: 'OK Clicked!!' ]


!GrafoscopioReplace methodsFor: 'initialization' stamp: 'OffrayLuna 9/17/2017 13:33'!
initializeWidgets
	find := self newTextInput
		ghostText: 'Text to find...';
		autoAccept: true.
	replace := self newTextInput
		ghostText: 'Text to replace...';
		autoAccept: true.
	ok := self newButton
		label: 'OK';
		state: false;
		action: [
			ok state: true.
			self window close. ] .
	cancel := self newButton
		label: 'Cancel';
		action: [
			cancel state: true. 
			self window close ].
	self focusOrder
		add: find;
		add: replace;
		add: ok;
		add: cancel.
	self askOkToClose: true

!GrafoscopioReplace methodsFor: 'initialization' stamp: 'OffrayLuna 9/16/2017 21:00'!
returnValues
	self ok state
		ifFalse: [ ^ self ] 
		ifTrue: [^ Dictionary new
			at: 'find' put: find getText;
			at: 'replace' put: replace getText;
			yourself]


!GrafoscopioReplace methodsFor: 'private' stamp: 'OffrayLuna 9/16/2017 18:50'!
okToChange
	^ true


!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
find
	^ find

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
cancel
	^ cancel

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
ok
	^ ok

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
replace
	^ replace

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
cancel: anObject
	cancel := anObject

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
find: anObject
	find := anObject

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
replace: anObject
	replace := anObject

!GrafoscopioReplace methodsFor: 'accessing' stamp: 'OffrayLuna 9/16/2017 17:40'!
ok: anObject
	ok := anObject


!GrafoscopioReplace methodsFor: 'api' stamp: 'OffrayLuna 9/16/2017 17:41'!
title
	^ 'Find &amp; Replace'

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioReplace class
	instanceVariableNames: ''!

!GrafoscopioReplace class methodsFor: 'specs' stamp: 'OffrayLuna 9/16/2017 17:37'!
defaultSpec
	^ SpecLayout composed
		newColumn: [ :column | 
			column 
				add: #find; 
				add: #replace;
				newRow: [ :row | row add: #ok; add: #cancel ] height: self toolbarHeight ];
		yourself
</t>
<t tx="ekr.20190224024804.29">
ComposableModel subclass: #GrafoscopioTextModel
	instanceVariableNames: 'body'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioTextModel commentStamp: 'OffrayLuna 5/26/2017 10:23' prior: 0!
I represent a text node inside a Grafoscopio notebook.
Usually my content is markdown text.!


!GrafoscopioTextModel methodsFor: 'API' stamp: 'johanfabry 4/14/2016 15:36'!
content: aGrafoscopioNodeContent
	body text: aGrafoscopioNodeContent


!GrafoscopioTextModel methodsFor: 'accessing' stamp: 'OffrayLuna 4/14/2016 11:16'!
body
	^ body

!GrafoscopioTextModel methodsFor: 'accessing' stamp: 'OffrayLuna 4/14/2016 11:16'!
body: anObject
	body := anObject


!GrafoscopioTextModel methodsFor: 'initialization' stamp: 'OffrayLuna 8/25/2016 13:58'!
initializeWidgets

	body := self newText.
	body beForText.
	body autoAccept: true.

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioTextModel class
	instanceVariableNames: ''!

!GrafoscopioTextModel class methodsFor: 'specs' stamp: 'johanfabry 4/14/2016 15:45'!
defaultSpec

	^ SpecLayout composed add: #body

</t>
<t tx="ekr.20190224024804.3">deleteReferencesToRoot: aRootNode
	| sparseTree |
	sparseTree := self preorderTraversal.

find: aString andReplaceWith: anotherString
	anotherString ifNil: [ ^ self ].
	self body: ((self body) copyReplaceAll: aString with: anotherString)
    
pandocOptions
	self metadata ifNil: [ ^ nil ].
	self metadata at: 'pandocOptions' ifAbsent: [ ^ '' ].
	^ self metadata at: 'pandocOptions'

pandocOptionsPrettyYaml
	"Convert pandoc options, if present into an indented Yaml block."
	| yamlOutput pretyOutput |
	pretyOutput := STON toStringPretty: self pandocOptions.
	yamlOutput := '' writeStream.
	yamlOutput nextPutAll: '|'; lf.
	pretyOutput linesDo: [ :line | 
		yamlOutput nextPutAll: '    ', line; lf   ].
	^ yamlOutput contents

replaceAccentedHTMLChars
	self body: (self body copyReplaceAll: '&amp;iacute;' with: 'í' )

removeLeadingLineNumbersSized: anInteger
	| cleanBody |
	cleanBody := ''.
	self body lines do: [ :line | | cleanLine |
		line size &gt;= anInteger 
			ifTrue: [ cleanLine := line copyFrom: anInteger to: line size. ]
			ifFalse: [ cleanLine := '' ].
		cleanBody := cleanBody, cleanLine, String cr  ].
	self body: cleanBody asString.
</t>
<t tx="ekr.20190224024804.30">DynamicComposablePresenter subclass: #GfUIHelpers
	instanceVariableNames: 'windowMainMenu tree nodeHeader nodeBody'
	classVariableNames: 'dockingBar recentNotebooks'
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GfUIHelpers commentStamp: 'OffrayLuna 6/26/2016 21:33' prior: 0!
I'm the Graphical User Interface for Grafoscopio environment. 

My main responsability is to provide grafoscopio with a docking bar
with menu options for open, browse notebooks, update the system
and its components and the help menu.
!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GfUIHelpers class
	instanceVariableNames: 'dockingBar recentNotebooks helpMenu'!

!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 5/3/2017 10:15'!
messageAbout
	"I show the author(s), license, sponsors and main contributors to the project 
	and point to further documentation on the web"
	LongMessageDialogWindow new
		entryText: 
			'_.:| Grafoscopio |:._', 
			(String with: Character cr),
			'(c) Copyright 2014-2017 by Offray Vladimir Luna Cárdenas',
			(String with: Character cr),
			'Covered under MIT license.',
			(String with: Character cr),
			(String with: Character cr),
			'[ Sponsors ]',
			(String with: Character cr),
			'mutabiT | www.mutabit.com  ',
			(String with: Character cr),		
			'HiTec Lab, Fundación Universitaria Los Libertadores | www.ulibertadores.edu.co  ',
			(String with: Character cr),
			(String with: Character cr),
			'[ Thanks to ]',
			(String with: Character cr),
			'HackBo, Hackerspace Bogota | http://hackbo.co',
			(String with: Character cr),
			'// Regular workshops attendees \\ 
					Rafael Medida, Iván Pulido, Camilo Hurtado',
			(String with: Character cr),
			'// Coffe talk (mostly about grafoscopio) \\
		Yanneth Gil, Andrés Calderón, Luis Alejandro Bernal',
			(String with: Character cr),
			'// Pharo, Moose and Agile Visualization communities \\
		Tudor Girba, Alexandre Bergel, Nicolai Hess, Peter Uhnák, Milton Mamani  ',
			(String with: Character cr),
			'// Family support while writing, coding &amp; travelling (among others!!) \\ 
		Divian Luna, Hilda Cárdenas',
			(String with: Character cr),
			(String with: Character cr),
				'For further details and versions go to:',
			(String with: Character cr),		
			(String with: Character cr),		
			'http://mutabit.com/grafoscopio';
		title: 'About Grafoscopio';
		open.

!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 2/18/2019 16:21'!
openFromRecentlyUsed	
	"Opens a recent notebooks list"
	| selection recentNotebooksReversed |

	self recentNotebooks
		ifNotEmpty: [
			recentNotebooksReversed := recentNotebooks reversed. 
			selection := UIManager default 
					chooseFrom: recentNotebooksReversed title: 'Choose a notebook...'.
			selection &gt; 0
				ifTrue: [ GrafoscopioNotebook new openFromFile: (recentNotebooksReversed at: selection)]
				ifFalse: [ self inform: 'No notebook selected!!' ]
		]
		ifEmpty: [self messageNoRecentDocuments]	
	



!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 5/3/2017 10:03'!
messageNotImplementedYet
	"Shows that a feature is not implemeted and point to further documentation on the web"

	UIManager default abort: 
		'This functionality is not implemented yet!!', 
		(String with: Character cr),
		'For more information about future releases, please visit:   ',
		(String with: Character cr),
		(String with: Character cr), 
		'http://mutabit.com/grafoscopio',
		(String with: Character cr),
		(String with: Character cr)
		title: 'To be implemented'.

!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 2/15/2019 09:33'!
messageNoRecentDocuments
	"Shows that a feature is not implemeted and point to further documentation on the web"

	UIManager default abort: 
		'Recent documents list is emtpy.', 
		(String with: Character cr),
		'To fill it, open a document using the Grafoscopio menu option at the top bar:',
		(String with: Character cr),
		(String with: Character cr), 
		'"Launch &gt; Notebook from file..."',
		(String with: Character cr),
		(String with: Character cr)
		title: 'No recent documents'.


!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 7/6/2017 18:37'!
updateSystem
	| tmp1 |
	tmp1 := UIManager default
		question: 'Do you wish to update all Grafoscopio and its co-dependencies ?'
		title: 'Grafoscopio update'.
	tmp1
		ifNotNil: [ tmp1
				ifTrue: [
					self
						updateGrafoscopio;
						updateDataviz.
					GrafoscopioDocumentation updateAll.
					self inform: 'System update finished.' ]]

!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 4/5/2017 18:29'!
updateUI
	"I update the User Interface (UI) with new versions of the docking bar or logos where available. 
	I'm helpful while testing new functionality that should be expossed to the user via the UI"
	self start.
	(World submorphs select: [ :each | each class = DockingBarMorph ]) 
		allButFirstDo: [ :bar | bar delete ].
	

!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 5/3/2017 11:23'!
updateDataviz
	"I update the Dataviz package with new versions of itself take from the source code
	repository. 
	DataViz contains Data visualization helpers"
	Gofer it 
 	  	smalltalkhubUser: 'Offray' project: 'Dataviz';
  	  	configurationOf: 'Dataviz';
	  	load.
	self inform: 'Dataviz package update finished.'

!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 9/25/2017 09:41'!
updateGrafoscopio
	"Updates Grafoscopio with new versions of itself take from the source code repository and 
	reloads the User Interface"
	Gofer new 
		smalltalkhubUser: 'Offray' project: 'Grafoscopio';
   		package: 'Grafoscopio';
    	load.
	GrafoscopioUtils update.

!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 8/19/2016 12:16'!
updateRecentNotebooksWith: aFileReference
	(self recentNotebooks includes: aFileReference) 
		ifFalse: [self recentNotebooks add: aFileReference].

!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 7/3/2017 21:51'!
updateDatavizUI
	"I'm the User Interface for updating the Dataviz package with new versions of itself 
	take from the source code repository"
	| update |	
	update := (UIManager default 
						confirm: 
							'Dataviz is data visualization package, with several', String cr,
							'Domain Specific Examples, like Panama Papers, Twitter Data Selfies.', 
							String cr, 'Do you want to update it?'
						label: 'Update Dataviz package'). 
	update ifFalse: [ ^ self ].
	self updateDataviz

!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 6/28/2016 10:27'!
updatePrerrequisitesScript
	"Updates the system prerequisites with new versions of itself take from the source code repository"
	
	"Visualization library (which also makes main menu loadable)"
	Gofer it
		smalltalkhubUser: 'ObjectProfile' project: 'Roassal2';
    	configurationOf: 'Roassal2';
    	loadStable.

	"Support for the STON format used in file persistance for grafoscopio notebooks"
	Gofer new 
		smalltalkhubUser: 'SvenVanCaekenberghe' project: 'STON';
		configurationOf: 'Ston';
		loadBleedingEdge.

	"Moose and Roassal integration"
	Gofer new
		smalltalkhubUser: 'Moose' project: 'Glamour';
		package: 'Glamour-Tools';
		package: 'Glamour-Roassal2-Presentations';
		load.
	
	Gofer new
		smalltalkhubUser: 'Moose' project: 'GToolkit';
		package: 'GT-InspectorExtensions-CoreRoassal';
		load.
		
	"Fast Table support"
	Gofer it 
    smalltalkhubUser: 'estebanlm' project: 'FastTable';
    package: 'FastTable';
    load.

	"Integration with external tools"
	Gofer new 
	   	smalltalkhubUser: 'Offray' project: 'Grafoscopio';
 	   	package: 'Grafoscopio-ExternalTools';
  	  	load.

	"HTML scrapping"
	Gofer new 
 	  	smalltalkhubUser: 'PharoExtras' project: 'Soup';
  	  	configurationOf: 'Soup';
   	  	loadStable.
	
	"SQLite support"
	Gofer new
    url: 'http://smalltalkhub.com/mc/PharoExtras/NBSQLite3/main';
    package: 'NBSQLite3';
    load.

	Gofer new
    url: 'http://smalltalkhub.com/mc/PharoExtras/NBSQLite3/main';
    package: 'NBSQLite3-Examples';
    load.
	
	"Support for Operative System integration"
	Gofer new
		squeaksource: 'OSProcess';
		package: 'OSProcess';
		load.
		
	Gofer new
		squeaksource: 'CommandShell';
		package: 'CommandShell-Piping';
		load.
		
	"Bibliographic support"
	Gofer new 
		squeaksource: 'Citezen';
     	package: 'ConfigurationOfCitezen';
     	load.


!GfUIHelpers class methodsFor: 'updating' stamp: 'OffrayLuna 8/11/2017 13:33'!
updateGrafoscopioUI
	"Updates Grafoscopio with new versions of itself take from the source code repository and 
	the User Interface"
	| update |
	
	update := (UIManager default 
						confirm: 'Do you wish to update Grafoscopio?' 
						label: 'Grafoscopio update').
	update ifFalse: [ ^ self ].
	self updateGrafoscopio.
	GrafoscopioUtils update.
	self updateUI.
	self inform: 'Grafoscopio update finished'


!GfUIHelpers class methodsFor: 'adding' stamp: 'OffrayLuna 11/21/2017 18:22'!
addToHelpMenu: aGrafoscopioNotebook 
	| metadata nbFile |
	metadata := aGrafoscopioNotebook metadata.
	nbFile := aGrafoscopioNotebook workingFile.
	(metadata at: 'showOnHelp' ifAbsent: [ ^ self ])
		ifTrue: [ 
			self helpMenu submorphs 
				detect: [ :s | s contents = (metadata at: 'shortTitle') ] 
				ifFound: [ 
					self inform: 
						'The notebook: ', String cr,
						nbFile fullName, String cr, 
						' needs another shortTitle to be added to the docking bar Help Menu.' ] 
				ifNone: [ 
					self helpMenu
						add: (metadata at: 'shortTitle')
						target: [ GrafoscopioNotebook open: nbFile ]
						selector: #value ] ].
	self updateUI


!GfUIHelpers class methodsFor: 'accessing' stamp: 'OffrayLuna 8/19/2016 12:04'!
recentNotebooks
	^ recentNotebooks ifNil: [recentNotebooks := OrderedCollection new ]

</t>
<t tx="ekr.20190224024804.31">PackageManifest subclass: #ManifestGrafoscopio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio'!
!ManifestGrafoscopio commentStamp: '&lt;historical&gt;' prior: 0!
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser!

ManifestGrafoscopio class
	instanceVariableNames: ''!

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 10/7/2016 20:34'!
ruleRBClassNameInSelectorRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'Documentation class' #current #true)) #'2016-10-07T19:39:23.013722-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 3/27/2017 22:18'!
ruleRBBooleanPrecedenceRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'GrafoscopioNode class' #cleanTreeRootReferences #true)) #'2017-03-27T22:18:17.447627-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 1/1/2017 21:48'!
ruleRBStringConcatenationRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'FileUtils class' #createFilesNamed:endingWith:intoFolder: #true)) #'2017-01-01T21:48:26.712639-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 4/5/2017 17:50'!
ruleRBEqualsTrueRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'GrafoscopioDocumentation class' #listOutdated #true)) #'2016-10-09T10:16:31.841951-05:00') #(#(#RGMethodDefinition #(#'GrafoscopioDocumentation class' #listOutdatedDocsIn: #true)) #'2017-04-05T17:50:59.032741-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 2/14/2019 12:36'!
ruleRBSentNotImplementedRuleV1FalsePositive
	^ #(#(#(#RGMetaclassDefinition #(#'GrafoscopioGUI class' #GfUIHelpers)) #'2015-12-23T10:38:16.706667-05:00') #(#(#RGClassDefinition #(#GfUIHelpers)) #'2016-01-06T18:53:45.844051-05:00') #(#(#RGMethodDefinition #(#GrafoscopioNotebook #topBar #false)) #'2016-12-17T18:51:40.617924-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 4/20/2017 19:01'!
ruleRBCascadedNextPutAllsRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNode #metadataAsYamlIn: #false)) #'2017-04-20T19:01:59.286212-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 1/31/2017 12:49'!
ruleRBShouldntRaiseErrorRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNodeTest #testInitializeIsOk #false)) #'2017-01-31T12:49:28.199769-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 10/31/2017 19:59'!
ruleSmTMethodTestedRuleV1FalsePositive
	^ #(#(#(#RGClassDefinition #(#GrafoscopioNode)) #'2017-10-31T19:59:03.294735-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 2/23/2017 21:08'!
ruleRBLongMethodsRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNotebook #topBar #false)) #'2016-12-17T18:51:33.99062-05:00') #(#(#RGMethodDefinition #(#GrafoscopioNotebook #notebookSubMenu #false)) #'2017-02-02T11:43:53.106456-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 4/5/2017 18:01'!
ruleRBBadMessageRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'GrafoscopioDocumentation class' #openNotebookFrom:At: #true)) #'2017-04-05T18:01:21.892153-05:00') )

!ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 3/28/2017 22:30'!
ruleRBAssignmentInIfTrueRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNode #embedNodes #false)) #'2017-02-16T20:07:02.600781-05:00') #(#(#RGMethodDefinition #(#GrafoscopioNotebook #navigateRelativePathFor: #false)) #'2017-03-28T22:30:53.541042-05:00') )

GrafoscopioDocs initialize!</t>
<t tx="ekr.20190224024804.32">Object subclass: #MendaIcons
	instanceVariableNames: 'icons'
	classVariableNames: 'Current'
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!MendaIcons commentStamp: 'OffrayLuna 9/7/2015 12:31' prior: 0!
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I'm MendaIcons the provider of this icons on this environment.

My main responsibility is to support some menda icons insideCallback pharo environment, for that I convert and package png images to the pharo image.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points!


!MendaIcons methodsFor: 'gt-inspector' stamp: 'OffrayLuna 9/9/2015 20:18'!
gtInspectorIconsIn: composite
	&lt;gtInspectorPresentationOrder: 40&gt;
	composite list 
		title: 'Icons';
		display: [ 
			self iconSelectors asSortedCollection 
				collect: [ :each | each -&gt; (self perform: each) ] ];
		icon: [ :each | each value ];
		format: [ :each | each key ]


!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:33'!
arrowRightIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowRightIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:30'!
arrowDownIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowDownIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:34'!
tagMinusIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self tagMinusIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:29'!
minusIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self minusIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:33'!
smalltalkCodeIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self smalltalkCodeIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:28'!
plusIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self plusIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:31'!
arrowUpIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowUpIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:33'!
tagAddIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self tagAddIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:32'!
arrowLeftIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowLeftIconContents base64Decoded readStream)


!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagAddIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/tagAdd.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAATFJREFUKJF90DFPAjEcBfD3GuByGg1qiH4FRyOrDhjipl9B
HR25+whu0NldJ0dmHJ2c1U0HY6KigKLJwYE8F8GjAf5Jk+bf/tq+slwunwDIwymSNgiCmtsf
lgGQJ7nrDklVa21xFgQASGpKOpXU/bvRn4VNYn4RhuExgKvEc6fiJDyqVCqXAApO1onYJDZ4
JHdI0j19EjYkraRoUo71zXcsZOOJmJJgrS1KqpL0k3B77xG31zk0Xv7bkiKS+5QEAGM4X3hG
OvODldUOvj4yiLsG9zfLqD/NAcBA0sEIJvFSrusbI2xsveLhLovPhofvdhpxJzUgeVgqlc6S
v4ogCGok91tvXtSs++j1DNotD826P4ZGGd0a3jy/2PPjKIV+34yhqdDJ7LloJkzgtTAMz921
X92gun92K18+AAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowLeftIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowLeft.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAOCAYAAAASVl2WAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAK1JREFUGJV9kcFpAmEQhb835rpo2giYHsSLBQhiH3NLCf/+
20XIRexAy7CLkAKEfZ42xNXswJy+j4H3Bts821rr0jayzXhqrTvbn8DHgzBASd+2VzEFM/MS
UxAgpiDArGmafyFA2L5KMjCz/TJOFJl5tL0H5hFxLqW83wkAmXkYJEmnv9JvikGStJB06rpu
CTw22bbtVtKX7Z+IWN8VNbr02vf95umjbFNKebPNDbaypHslWRyiAAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowRightIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowRight.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAOCAYAAAASVl2WAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAMVJREFUGJV9kTFqw0AQRf/M2pWsQK4RMDit2lTpDSbXkFCV
I6xW13AZcK20ukAgOYb7IPTSxMFWLH8YGHgPZpgRoJTSGtC1Cnmev0ra933/VRTFpyZxMzsA
RzPbN02z/SeUZfnh7k9zkkvSLclPzZxkwMXMtm3X4zi+m9k98OKaZBiGpZktAMzs+0JIKT2G
EDpgBeyqqjosziHQSVoBu7qu3/6WjDFufmF+DiUpZFm2cfdO0t0Uni75DFyFkiRAMcaHuWf9
APv6mfGc3+HbAAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowDownIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowDown.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAICAYAAADJEc7MAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAALJJREFUGJV9zjEKwkAUBND5i3ZaeJBAcgavIIjX2GwK8QbZ
/bmGjSDYaq5gE/Aa9hIyNkZkXf0w1fCGD5IIIexUNSOJf6nrOvfeb0lCXuBK8m6MWVprOyTO
e5+LSAtgDiA31tqO5EZEFsMwtE3TZDFS1WJEJNfOuZsBAOfc4RdW1YLkZURVVR0BQEi+l0MI
KxHZj2/3fT81xpxj9AVjLCITkrMYJWGEmUI/4Qd+lGV5SvVPkLiZ0qKAa5MAAAAASUVORK5C
YII='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowUpIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowUp.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAICAYAAADJEc7MAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAJRJREFUGJWNy8EJQjEQBNCdVGAdwtca/LYg2EdIsIjNliHi
xQ6sQfRgF4L/LOx4EnJIPg7MaeaBpLRiZnuSn5TSpbWHGXQEcC6l7P6CFXqJyATg1MKhh0hu
AGx7OPRQSukZY7y7+9jCoYd+h5zzw91Hku8aw8wGd7+1UB1VXQG4AliQXAtJUdWDqi5JylzN
bFDVTFK+Zz+PhDBK0j8AAAAASUVORK5CYII='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
plusIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/plus.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAKVJREFUKJHVkjEOgkAQRd9suIFcxUhvZeJpCA2FhoJ2uYyN
nEE9CZ5hP4WQkHVJjIWJv5r5839m83dMEjG6ritCCO3U1lVV3WJN9uYCJOVmtgcws01K41Lk
J/i90bz3haQ84rfAeaob4LEcShqyEEI7B7GCJsH1Xz81A+o4ckm7eZOZnYD7cu6ce1rqALz3
R+AyGQ9lWV5jzR/949qtDkAPryBSmhE5/jJyCd+z1gAAAABJRU5ErkJggg=='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
smalltalkCodeIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/smalltalkCode.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAQhJREFUKJHtkrFOw0AQRGfOJ1FdkSB6pLgN+QAaJCQkfsS1
ZbcUDm18EvK/UOQPEA1ROiy+gDQBdxz20BwSsiho0jHV7urN7BbLuq4fJc0kbUn2xpiboige
6rq+JdmXZblcrVbnJJeSLMk5ydZKmpGckrwAAEl3AEDyTNInABhjTgBckkRkUkNyG5vTJEkm
zrk1RnLO3SdJMhmGIY2hGyupJwlr7Vue5/uxCQCyLAsA9t57G5f05jfwL/o3HsJo4xshhHDs
vbdd171XVfXxE2qa5iiE4ABMv32G5BwAjDEvAHbOuatxegjhGsAOwHMcLSzJVlJKciOpjwAA
PAHoY/0qaR2vW0hqvwBnzXKb8TsomwAAAABJRU5ErkJggg=='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagMinusIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/tagMinus.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAPhJREFUKJGF0bFKQzEUBuD/D9Zy3RQKPsh9gkpx7Cuoo+NN
HqHbvZm76+TYuY4+gqubIDg4iFBbaP8u9ZIcrrcHAiHJl5NzwrquZwBKmCAZvfdLu/4XDkBJ
8toOSYsY46QPAgAkfUmaS1ofMhZ92CXzpxDCPYCX5Ln/4hTeNU3zDGBsau3ELjkwJHlFkvb2
LuxIRkmrrjr6MCUhxjiRtCBZHLtA0orklJIAIMPl+AOD020G3l4v8Pl+BgA7STctTPH5aF04
pwz+fA+w+T3ZkbytquohgzazeWWLgPw7AADe+yXJqWlYhtrmdEWSeWhRL0zwZQjh0e7tAVcM
m6R0vbZ+AAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
minusIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/minus.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAADCAYAAACj1j4PAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAADhJREFUCJlj7O7uDmNgYEhjIAEwMTFNZ2FkZJRjYGBwJkXj
379/t7D8////AQMDw05SNDIwMDwEANK6DIovD6CyAAAAAElFTkSuQmCC'


!MendaIcons methodsFor: 'initialization' stamp: 'OffrayLuna 9/9/2015 20:18'!
initializeIcons
	icons := LRUCache new 
		maximumWeight: 64;
		factory: [ :key | self perform: key ];
		yourself

!MendaIcons methodsFor: 'initialization' stamp: 'OffrayLuna 9/9/2015 20:18'!
initialize
	super initialize.
	self initializeIcons

!MendaIcons methodsFor: 'initialization' stamp: 'OffrayLuna 9/9/2015 20:18'!
iconSelectors
	^ self class selectors select: [ :each | '*Icon' match: each asString ]

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MendaIcons class
	instanceVariableNames: ''!

!MendaIcons class methodsFor: 'instance creation' stamp: 'OffrayLuna 9/9/2015 20:18'!
current
	^ Current ifNil: [ Current := self new ]
    
</t>
<t tx="ekr.20190224024804.33">Object subclass: #MindMap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!MindMap commentStamp: 'OffrayLuna 12/13/2017 13:04' prior: 0!
I provide support for minmapping Freemind import and d3js export.
In the future I'll plan to support exporting from Grafoscopio notebooks
to javascript enabled web presentations.!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MindMap class
	instanceVariableNames: ''!

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:13'!
d3TreeDemoData
	"I'm demo data for the tutorial contain at: https://blog.pixelingene.com/2011/07/building-a-tree-diagram-in-d3-js/"
	^ 'var treeData = {
    name: "/",
    contents: [
        {
            name: "Applications",
            contents: [
                { name: "Mail.app" },
                { name: "iPhoto.app" },
                { name: "Keynote.app" },
                { name: "iTunes.app" },
                { name: "XCode.app" },
                { name: "Numbers.app" },
                { name: "Pages.app" }
            ]
        },
        {
            name: "System",
            contents: []
        },
        {
            name: "Library",
            contents: [
                {
                    name: "Application Support",
                    contents: [
                        { name: "Adobe" },
                        { name: "Apple" },
                        { name: "Google" },
                        { name: "Microsoft" }
                    ]
                },
                {
                    name: "Languages",
                    contents: [
                        { name: "Ruby" },
                        { name: "Python" },
                        { name: "Javascript" },
                        { name: "C#" }
                    ]
                },
                {
                    name: "Developer",
                    contents: [
                        { name: "4.2" },
                        { name: "4.3" },
                        { name: "5.0" },
                        { name: "Documentation" }
                    ]
                }
            ]
        },
        {
            name: "opt",
            contents: []
        },
        {
            name: "Users",
            contents: [
                { name: "pavanpodila" },
                { name: "admin" },
                { name: "test-user" }
            ]
        }
    ]
};'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:39'!
d3TreeUpdater
	^ 'function update (source) { 
			// Compute the new tree layout.
			var nodes = tree.nodes(root).reverse(),
				links = tree.links(nodes);
				
			// Normalize for fixed-depth.
			nodes.forEach(function(d) { d.y = d.depth * 180 });
			
			// Declare the nodes
			var node = svg.selectAll("g.node")
				.data(nodes, function(d) { return d.id || (d.id = ++i); });
			
			// Enter the nodes.
			var nodeEnter = node.enter().append("g")
				.attr("class", "node")
				.attr("transform", function(d) { 
				 	return "translate(" + d.y + "," + d.x + ")";});
					
			nodeEnter.append("circle")
				.attr("r",10)
				.style("fill", "#fff");
				
			nodeEnter.append("text")
				.attr("x", function (d) { 
				 return d.children || d._children ? -13 : 13; })
				.attr("dy", ".35em")
				.attr("text-anchor", function(d) { 
				 return d.children || d._children ? "end" : "start"; })
				.text(function(d) { return d.name; })
				.style ("fill-opacity", 1);
				
			// Declare the links
			var link = svg.selectAll("path.link")
				.data(links, function(d) { return d.targed.id });
				
			// Enter the links.
			link.enter().insert("path","g")
				.attr("class", "link")
				.attr("d", diagonal);
			
	}'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:44'!
d3CSS
	"I define the nodes geometrical form, their text and the links between them."
	^ ' .node circle {
   fill: #fff;
   stroke: steelblue;
   stroke-width: 3px;
 }

 .node text { font: 12px sans-serif; }

 .link {
   fill: none;
   stroke: #ccc;
   stroke-width: 2px;
 }'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:55'!
d3TreeDiagramProperties
	^ 'var margin = {top: 20, right: 120, bottom: 20, left: 120},
 width = 960 - margin.right - margin.left,
 height = 500 - margin.top - margin.bottom;
 
var i = 0;

var tree = d3.layout.tree()
 .size([height, width]);'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:03'!
d3SVGAppender
	"I append the SVG working area to the body of our web page and create a group elements 
	(&lt;g&gt;) that will contain the SVG objects (the nodes, text and links)"

	^'var svg = d3.select("body").append("svg")
 .attr("width", width + margin.right + margin.left)
 .attr("height", height + margin.top + margin.bottom)
  .append("g")
 .attr("transform", "translate(" + margin.left + "," + margin.top + ")");'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:24'!
d3TreeUpdaterCaller
	^ 'update(root)'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:11'!
d3TreeRootDefinition
	"For an excellent explanation on whi this, look at:
	http://www.d3noob.org/2014/01/tree-diagrams-in-d3js_11.html"
	^ 'root = treeData[0];'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:57'!
d3TreeLinksDrawerFunction
	^ 'var diagonal = d3.svg.diagonal()
 .projection(function(d) { return [d.y, d.x]; });'

</t>
<t tx="ekr.20190224024804.34">
Object subclass: #Pandoc
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!Pandoc commentStamp: 'OffrayLuna 12/6/2017 15:43' prior: 0!
I model the interaction between Pandoc and Grafoscopio.!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Pandoc class
	instanceVariableNames: 'executable'!

!Pandoc class methodsFor: 'utility' stamp: 'OffrayLuna 10/3/2018 09:58'!
extractImagesInUnixFor: aFileReference withFilter: aLuaFilter
	"I use Pandoc Lua scripting capabilities to extract al images links in aFileReference"

	OSSUnixSubprocess new
	command: 'pandoc';
	arguments: {aFileReference fullName .  '--lua-filter=',aLuaFilter fullName };
	redirectStdout;
	redirectStderr;
	runAndWaitOnExitDo: [ :process :outString :errString |
		process isSuccess
			ifTrue: [ 
				^ ((Soup fromString: outString) findAllTags: 'td') collect: [ :each | each next ] ]
			ifFalse: [
				"OSSUnixProcessExitStatus has a nice #printOn: "
				Transcript show: 'Command exit with error status: ', process exitStatusInterpreter printString; cr.
				Transcript show: 'Stderr contents: ', errString.
			]
	]

!Pandoc class methodsFor: 'utility' stamp: 'OffrayLuna 12/6/2017 18:25'!
luaFilters
	"I define the location of set of scripts, that allows to change the default behaviour of Pandoc
	and/or the processing of supported markup languages. 
	
	For more information about Lua filters see:
	
	https://pandoc.org/lua-filters.html
	"

	| filters |
	filters := OrderedCollection new.
	filters 
		add: 'http://mutabit.com/repos.fossil/dataweek/doc/tip/Artefactos/Scripts/image-links.lua'.
	^ filters


!Pandoc class methodsFor: 'converters' stamp: 'OffrayLuna 12/4/2018 23:42'!
htmlToMarkdown: inputFile
	
	| outputFile |
	outputFile := FileLocator temp / 'body.md'.
	outputFile ensureDelete.
	outputFile ensureCreateFile.
	OSSUnixSubprocess new
		command: 'pandoc';
		arguments: {'-f'. 'html'. '-t'. 'markdown'. '--atx-headers'. inputFile fullName. 
			'--output'. outputFile fullName  };
	redirectStdout;
	redirectStderr;
	runAndWaitOnExitDo: [ :process :outString :errString |
		process isSuccess
			ifTrue: [ ^ outputFile contents ]
			ifFalse: [ ^inputFile contents ]
	]


!Pandoc class methodsFor: 'accessing' stamp: 'OffrayLuna 12/6/2017 15:45'!
executable
	^ executable ifNil: [ self executableLocation ]

!Pandoc class methodsFor: 'accessing' stamp: 'OffrayLuna 12/6/2017 15:44'!
executable: aFileReference
	executable := aFileReference 

!Pandoc class methodsFor: 'accessing' stamp: 'OffrayLuna 12/6/2017 15:58'!
executableLocation
	| location |
	location := '/usr/bin/pandoc'.
	location asFileReference exists
		ifTrue: [ ^ location ]
		ifFalse: [ self definePandocExecutable ]


!Pandoc class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/6/2017 18:25'!
downloadLuaFilters
	self luaFilters do: [ :filter | | filterUrl |
		filterUrl := filter asUrl.
		(FileLocator temp asFileReference / (filterUrl segments last)) exists
			ifFalse: [ 
				ZnClient new
					url:  filterUrl;
					downloadTo: FileLocator temp ] ]

!Pandoc class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 10/3/2018 10:00'!
listImagesFrom: aFileReference
	"I provide a list of all images contained in aFile."
	| filter commandString outputString |
	filter := FileLocator temp asFileReference / 'image-links.lua'.
	filter exists ifFalse: [ self downloadLuaFilters ].
	commandString := 'pandoc ', aFileReference fullName, ' --lua-filter=',filter fullName.
	Smalltalk platformName = 'unix'
		ifTrue: [ ^ self extractImagesInUnixFor: aFileReference withFilter: filter  ].
	Smalltalk platformName = 'Win32'
		ifTrue: [ self ].
        
</t>
<t tx="ekr.20190224024804.4">becomeDefaultTree
	"Create a starting tree for all Grafoscopio notebooks with just one textual node as child."
	| node1 |
	self class new.
	self
		level: 0;
		header: 'Arbol principal';
		tagAs: 'código'.	
	node1 := self class new
		header: 'Node 1';
		body:  '';
		tagAs: 'text'.	
	self addNode: node1.
	^ self

becomeDefaultTestTree
	| node1 node2 node3 node4 |
	self 
		level: 0; 
		header: 'Arbol principal'.	
	node1 := self class new
		header: 'Markup';
		body:  'I am &lt;b&gt;just a node with markup&lt;/b&gt;';
		tagAs: 'text';
		links: 'temp.md';
		level: 1.
	node2 := self class new
		header: '%output Code';
		tagAs: 'código';
		body:  '(ConfigurationOfGrafoscopio&gt;&gt;#version14:) sourceCode'.
	node3 := self class new
		header: '%invisible';
		tagAs: 'text';
		body:  '&lt;i&gt;Just testing&lt;/i&gt;'.
	node1 addNode: node3.
	node4 := self class new
		header: 'Something';
		tagAs: 'text';
		body:  '&lt;h1&gt;else&lt;/h1&gt;'.
	node1 addNode: node4.
	node1 addNode: node2.
	self 
		addNode: node1.
        
initialize
	"Create a empty new node"
	super initialize.
	self 
		header: 'newHeader';
		tagAs: 'text';
		body: '';
		level: 0
</t>
<t tx="ekr.20190224024804.5"></t>
<t tx="ekr.20190224024804.6">ancestors
	"I return a collection of all the nodes wich are ancestors of the receiver node"
	| currentNode ancestors |
	currentNode := self.
	ancestors := OrderedCollection new.
	[ currentNode parent notNil and: [ currentNode level &gt; 0 ] ]
		whileTrue: [ 
			ancestors add: currentNode parent.
			currentNode := currentNode parent].
	ancestors := ancestors reversed.
   ^ ancestors
   
ancestorsAll
	"I return a collection of all the nodes wich are ancestors of the receiver node"
	| currentNode ancestors |
	currentNode := self.
	ancestors := OrderedCollection new.
	[ currentNode parent notNil and: [ currentNode level &gt; 0 ] ]
		whileTrue: [ 
			ancestors add: currentNode parent.
			currentNode := currentNode parent].
	ancestors := ancestors reversed.
   ^ ancestors
   
ancestorsHeaders
	"Returns the headers of all the ancestors of the node. "
	"Maybe this and 'headers' should be integrated, so both act on a collection of children instead of"
	"having two separate methods"
	| currentNode ancestors |
	currentNode := self.
	ancestors := OrderedCollection new.
	(self level - 1) 
		timesRepeat: [ 
			ancestors add: currentNode parent.
			currentNode := currentNode parent.].
	ancestors := ancestors reversed.
   ^ ancestors collect: [:ancestor | ancestor header ]
   
asText
	^ self body

body
	"Returns the receivers body"
	^ body
    
children 
	"Returns the receivers list of children"
	^ children ifNil: [ children := OrderedCollection new ]
    
clipboard
	^ clipboard
    
content
	"Returns the receivers body"
	^ body
    
hasChildren
	(self children size &gt; 0)
		ifTrue: [ ^true ]
		ifFalse: [ ^false ]

header
	"Returns the receiver header"
	^ header

headers
	"Returns the headers of the receiver children"
	^ headers := self children collect: [:currentNode | currentNode header ]
    
icon 
 	"Returns the receivers icon"
	^icon

isEmpty
	body ifNil: [ ^ true ] ifNotNil: [ ^ false ]
    
key 	
	"Returns a unique key identifying the receiver in the help system"	
	^key
    
lastLink
	self links ifNil: [ ^ '' ].
	self links ifEmpty: [ ^ '' ].
	^ self links last
    
lastNetLink
	^ self links detect: [ :l | l asZnUrl isURL ]
    
level 	
	"Returns the level of the node. See the setter message for details"	
	^level

links
	"I model local or remote links that are associated to a particular node."
	^ links ifNil: [ ^ links := OrderedCollection new ]
    
output
	(self isTaggedAs: 'código') ifFalse: [ ^ self ].
	self body ifNil: [ ^ nil ].
	^ (Compiler evaluate: self body)
    
parent
	"Returns the parent of the current node"
	^ parent

tags 
	"I returns the receiver tags."
	| migration |
	tags isString 
		ifTrue: [ 
			migration := tags.
			tags := OrderedCollection new.
			self tagAs: migration ].
	tags ifNil: [ 
		tags := OrderedCollection new.
		self tagAs: 'text' ].
	^ tags

title
	"Return the header"
	^ header
    
root
	"Return the root node of the Grafoscopio tree, i.e the common ancestor of all other nodes"
	self level = 0 
		ifFalse: [ ^ self ancestors first ].
	^ self

specModelClass
	(self isTaggedAs: 'código') ifTrue: [^GrafoscopioCodeModel].
	(self isTaggedAs: 'johan') ifTrue:[^GrafoscopioButtonModel].
	"por defecto"
	^ GrafoscopioTextModel
</t>
<t tx="ekr.20190224024804.7">body: anObject
	"Sets the receivers body to the given object"
	body := anObject
    
children: aCollection
	"Sets the receivers children"
	aCollection do: [:currentNode | currentNode parent: self  ].
	children := aCollection.
    
clipboard: anObject
	clipboard := anObject

content: anObject
	"Sets the receivers body to the given object"
	body := anObject
    
links: anObject
	self links add: anObject

level: anInteger
	"Sets the node level in a hierarchy. The only node with level 0 is the root node and from there levels increase"
	"in 1 for its direct children, 2 for its grand children and so on. Silibings nodes has the same level"	
	level := anInteger 

header: anObject
	"Sets the receivers header"
	header := anObject 

icon: aSymbol
	"Sets the receivers icon"
	icon := aSymbol
    
key: aUniqueKey
	"Sets a unique key identifying the receiver in the help system"	
	key := aUniqueKey 

output: anObject
	output := anObject

parent: aNode
	"A parent is a node that has the current node in its children"
	aNode ifNil: [ 
		parent := aNode.
		^self ]. 
	aNode parent = self ifTrue: [ ^ self ].
	parent := aNode.
	(aNode children includes: self) 
		ifFalse: [ aNode addNode: self ]
        
saveContent: anObject
	"Sets the receivers body to the given object"
	body := anObject

tagAs: aTag
	"Tags the recipient node with aTag (string). For the moment we will have only one tag. 
	In the future we will have several and there will be rules to know how tags interact with 
	each other"

	aTag = 'código' ifTrue: [ ^ self toggleCodeText ].
	(self tags includes: aTag)
		ifFalse: [ self tags add: aTag ].
	^ self

tags: aCollection 
	tags := aCollection
</t>
<t tx="ekr.20190224024804.8">addLink: anUrl
	"anUrl is a string"
	(self links includes: anUrl) 
		ifFalse: [ self links add: anUrl ]

checksum
	"I return the SHA1SUM of the current tree. I'm used to test changes on the contents"
	"and for traceability of how the document tree is converted to other formats, as markdown."
	^ (SHA1 new hashMessage: self root flatten asSton) hex
    
htmlToMarkdown
	"I convert the node body from HTML format to Pandoc's Markdown."
	| htmlFile |	
	(self isTaggedAs: 'código' ) ifTrue: [ ^self ].
	((self headerStartsWith: '%invisible') "or:[self hasAncestorHeaderWith: '%invisible']") 
		ifTrue: [ ^self ].
	htmlFile := FileLocator temp asFileReference / 'body.html'.
	htmlFile ensureCreateFile.
	htmlFile writeStreamDo: [:out | out nextPutAll: self body ].
	Smalltalk platformName = 'unix'
		ifTrue: [ self body: (Pandoc htmlToMarkdown: htmlFile) ].
	Smalltalk platformName = 'Win32'
		ifTrue: [ self shouldBeImplemented ].
	htmlFile ensureDelete.
    
htmlToMarkdownSubtree
	"I convert self and childern nodes body from HTML format to Pandoc's Markdown."
	 self preorderTraversal do: [ :each | each htmlToMarkdown ]
     
isTaggedAs: aString
	self tags ifEmpty: [ self tagAs: 'text' ].
	^ self tags includes: aString
 
linksToMarkdownFile
	"I detect if the links contains any reference to a file ending in '.md' or '.markdown'"
	self links 
		ifNotNil: [ 
			self links 
				detect: [:l | (l endsWith: '.md') or: [ l endsWith: '.markdown']]
					ifFound: [ ^ true ]
					ifNone: [^ false]].
	^ false

localFilesLinks
	"I collect all the links that point to the local file system. Because is supposed that
	links contains only references to remote URL or local files, anything that is not a URL is
	treated as a loca file link."
	^ self links collect: [ :l | l asZnUrl host isNil ]	

metadata
	| mnode |
	mnode := self root preorderTraversal 
		detect: [ :n | n headerStartsWith: '%metadata' ]
		ifNone: [ ^ nil ].
	^ mnode output.
	  
preorderTraversal
	nodesInPreorder := OrderedCollection new.
	self visitedGoTo: nodesInPreorder.
	^ nodesInPreorder.
        
selectMarkdownSubtreesToExport
	^ (self root preorderTraversal) select: [ :each | each linksToMarkdownFile ].

surfaceCopy
	"I copy the most relevant values of the receiver. I'm useful to avoid copying references
	to the rest of the container tree, which could end in copying the whole tree."
	| newNode |
	newNode := self class new.
	^ newNode
		header: self header;
		body: self body;
		tags: self tags.

subtreeCopy
	"I return the same node if its subtree only contains the receiver, or a copy of the receivers
	subtree, in other cases."
	| linearSubtree linearSubtreeCopy |
	linearSubtree := self preorderTraversal. 
	linearSubtreeCopy := OrderedCollection new.
	linearSubtree do: [ :cn | linearSubtreeCopy add: cn surfaceCopy ].
	linearSubtreeCopy allButFirst doWithIndex: [ :n :i | | parentPos |
		parentPos := linearSubtree indexOf: (linearSubtree at: i+1) parent.
		n parent: (linearSubtreeCopy at: parentPos) ].
	^ linearSubtreeCopy at: 1.
    
toggleCodeText
	"Some tags are exclusionary."
	"For example a node can not be tagged as text and as 'code' (código) simultaneosly."
	"In that case, I replace the ocurrence of one tag by the other to warranty that both are not in the same node."
	(self isTaggedAs: 'text')
		ifTrue: [ ^ self tags replaceAll: 'text' with: 'código'].
	(self isTaggedAs: 'código')
		ifTrue: [ ^ self tags replaceAll: 'código' with: 'text' ].

visitLastLink
	self lastLink = '' 
		ifTrue: [ self inform: 'This node has no associated links to visit'. ^ self ].
	[WebBrowser openOn: self lastLink] fork
    
wrapBodyLines
		"I convert the node body from HTML format to Pandoc's Markdown."
	| bodyFile |	
	(self isTaggedAs: 'código' ) ifTrue: [ ^self ].
	bodyFile := FileLocator temp asFileReference / 'body.txt'.
	bodyFile ensureCreateFile.
	bodyFile writeStreamDo: [:out | out nextPutAll: self body ].
	Smalltalk platformName = 'unix'
		ifTrue: [ self body: (self wrapBodyLinesFor: bodyFile) ].
	Smalltalk platformName = 'Win32'
		ifTrue: [ self shouldBeImplemented ].
	bodyFile ensureDelete.

wrapBodyLinesFor: inputFile 
	| outputFile |
	outputFile := FileLocator temp / 'body.tmp.txt'.
	outputFile ensureDelete.
	outputFile ensureCreateFile.
	OSSUnixSubprocess new
		command: 'fold';
		arguments: {'-sw'.  '80'. inputFile fullName. outputFile fullName};
	redirectStdout;
	redirectStderr;
	runAndWaitOnExitDo: [ :process :outString :errString |
		process isSuccess
			ifTrue: [ ^ outString  ]
			ifFalse: [ 
				self inform: errString.
				^inputFile contents ]
	]
</t>
<t tx="ekr.20190224024804.9">addNode: aNode
	"Adds the given node to the receivers collection of children, and sets this object as the parent
	 of the node"
	"aNode parent = self ifTrue: [ ^ self ]."
	self children add: aNode.
	aNode level: (self level) + 1.
	aNode parent: self.
	^aNode

addNodeAfterMe
	"Adds a generic node after the given node so they become slibings of the same parent"
	| genericNode |
	genericNode := self class new header: 'newNode'; body: ''.
	self parent children add: genericNode after: self.
	genericNode parent: self parent.
	genericNode level: self level.
	^ genericNode
    
copyToClipboard	
	self class clipboard: self subtreeCopy.

removeNode: aNode
	(self children includes: aNode)
		ifTrue: [ self children remove: aNode ]
		ifFalse: [ self inform: 'The node doesn''t belong to this node children' ]
	
pasteFromClipboard
	| clipchild |	
	self class clipboard 
		ifNotNil: [ 
			clipchild := self class clipboard.
			self addNode: clipchild.
			clipchild  ]
		ifNil: [ self inform: 'Cache is emtpy. Pleas cut/copy a node before pasting' ]
	
removeLastNode
	"Adds the given node to the receivers collection of children, and sets this object as the parent"
	" of the node"
	self children removeLast.
    
visitedGoTo: aCollection
	"Stores the current node in a collection and recursively stores its children"
	aCollection add: self.
	(self children isNotEmpty) &amp; ((self header findString: '#invisible')=1) not
		ifTrue: [ (self children) do: [ :eachNode | eachNode visitedGoTo: aCollection]].</t>
<t tx="ekr.20190224024812.1">@language rest
@wrap

===== Accuracy

These sources come from a "file out" (.st) file, which I then modified by hand.

There is no guarantee that errors have not crept in.

===== Syntax coloring

This file uses @language smalltalk, which does not have multi-line strings.

I have edited those strings by hand.

Perhaps "yourself" should also be syntax colored.

===== Structure

Some classes still have "structure" comments, like this:

!GrafoscopioCodeModel commentStamp: 'OffrayLuna 5/26/2017 10:22' prior: 0!</t>
</tnodes>
</leo_file>
