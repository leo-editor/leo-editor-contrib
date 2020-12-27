<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20201219054931.1"><vh>Transcrypt study outline</vh></v>
<v t="ekr.20201219054931.2"><vh>@@clean compiler.py</vh>
<v t="ekr.20201219055031.1"><vh>&lt;&lt; legal notices &gt;&gt;</vh></v>
<v t="ekr.20201219054931.3"><vh>&lt;&lt; imports &gt;&gt;</vh></v>
<v t="ekr.20201219054931.4"><vh>&lt;&lt; data &gt;&gt;</vh></v>
<v t="ekr.20201219054931.5"><vh>class Program</vh>
<v t="ekr.20201219054931.6"><vh>Program.__init__</vh></v>
<v t="ekr.20201219054931.7"><vh>Program.provide</vh></v>
</v>
<v t="ekr.20201219054931.8"><vh>class Module</vh>
<v t="ekr.20201219054931.9"><vh>Module.__init__</vh></v>
<v t="ekr.20201219054931.10"><vh>Module.findPaths</vh></v>
<v t="ekr.20201219054931.11"><vh>Module.generateJavascriptAndPrettyMap</vh></v>
<v t="ekr.20201219054931.12"><vh>Module.loadJavascript</vh></v>
<v t="ekr.20201219054931.13"><vh>Module.parse</vh></v>
<v t="ekr.20201219054931.14"><vh>Module.dumpTree</vh></v>
</v>
<v t="ekr.20201219054931.15"><vh>class Generator(ast.NodeVisitor)</vh>
<v t="ekr.20201219054931.16"><vh>Generator.__init__</vh></v>
<v t="ekr.20201219054931.17"><vh>Generator.visitSubExpr</vh></v>
<v t="ekr.20201219054931.18"><vh>Generator.filterId</vh></v>
<v t="ekr.20201219054931.19"><vh>Generator.tabs</vh></v>
<v t="ekr.20201219054931.20"><vh>Generator.emit</vh></v>
<v t="ekr.20201219054931.21"><vh>Generator.indent</vh></v>
<v t="ekr.20201219054931.22"><vh>Generator.dedent</vh></v>
<v t="ekr.20201219054931.23"><vh>Generator.inscope</vh></v>
<v t="ekr.20201219054931.24"><vh>Generator.descope</vh></v>
<v t="ekr.20201219054931.25"><vh>Generator.getScope</vh></v>
<v t="ekr.20201219054931.26"><vh>Generator.getAdjacentClassScopes</vh></v>
<v t="ekr.20201219054931.27"><vh>Generator.emitComma</vh></v>
<v t="ekr.20201219054931.28"><vh>Generator.emitBeginTruthy</vh></v>
<v t="ekr.20201219054931.29"><vh>Generator.emitEndTruthy</vh></v>
<v t="ekr.20201219054931.30"><vh>Generator.adaptLineNrString</vh></v>
<v t="ekr.20201219054931.31"><vh>Generator.isCommentString</vh></v>
<v t="ekr.20201219054931.32"><vh>Generator.emitBody</vh></v>
<v t="ekr.20201219054931.33"><vh>Generator.emitSubscriptAssign</vh></v>
<v t="ekr.20201219054931.34"><vh>Generator.nextTemp</vh></v>
<v t="ekr.20201219054931.35"><vh>Generator.skipTemp</vh></v>
<v t="ekr.20201219054931.36"><vh>Generator.skippedTemp</vh></v>
<v t="ekr.20201219054931.37"><vh>Generator.getTemp</vh></v>
<v t="ekr.20201219054931.38"><vh>Generator.prevTemp</vh></v>
<v t="ekr.20201219054931.39"><vh>Generator.useModule</vh></v>
<v t="ekr.20201219054931.40"><vh>Generator.isCall</vh></v>
<v t="ekr.20201219054931.41"><vh>Generator.getPragmaFromExpr</vh></v>
<v t="ekr.20201219054931.42"><vh>Generator.getPragmaFromIf</vh></v>
<v t="ekr.20201219054931.43"><vh>Generator.visit</vh></v>
<v t="ekr.20201219054931.44"><vh>Generator.visit_arg</vh></v>
<v t="ekr.20201219054931.45"><vh>Generator.visit_arguments</vh></v>
<v t="ekr.20201219054931.46"><vh>Generator.visit_AnnAssign</vh></v>
<v t="ekr.20201219054931.47"><vh>Generator.visit_Assert</vh></v>
<v t="ekr.20201219054931.48"><vh>Generator.visit_Assign</vh></v>
<v t="ekr.20201219054931.49"><vh>Generator.visit_Attribute</vh></v>
<v t="ekr.20201219054931.50"><vh>Generator.visit_Await</vh></v>
<v t="ekr.20201219054931.51"><vh>Generator.visit_AugAssign</vh></v>
<v t="ekr.20201219054931.52"><vh>Generator.visit_BinOp</vh></v>
<v t="ekr.20201219054931.53"><vh>Generator.visit_BoolOp</vh></v>
<v t="ekr.20201219054931.54"><vh>Generator.visit_Break</vh></v>
<v t="ekr.20201219054931.55"><vh>Generator.visit_Bytes</vh></v>
<v t="ekr.20201219054931.56"><vh>Generator.visit_Call</vh></v>
<v t="ekr.20201219054931.57"><vh>Generator.visit_ClassDef</vh>
<v t="ekr.20201226151328.1"><vh>&lt;&lt; parse decorators &gt;&gt;</vh></v>
<v t="ekr.20201226151343.1"><vh>&lt;&lt; generator decorators &gt;&gt;</vh></v>
<v t="ekr.20201226151908.1"><vh>&lt;&lt; define lists &gt;&gt;</vh></v>
<v t="ekr.20201226151532.1"><vh>&lt;&lt; Handle one statement in node.body &gt;&gt;</vh></v>
<v t="ekr.20201226151714.1"><vh>&lt;&lt; Handle class var assigns &gt;&gt;</vh></v>
<v t="ekr.20201226151440.1"><vh>&lt;&lt; define emitters &gt;&gt;</vh></v>
</v>
<v t="ekr.20201219054931.58"><vh>Generator.visit_Compare</vh></v>
<v t="ekr.20201219054931.59"><vh>Generator.visit_Continue</vh></v>
<v t="ekr.20201219054931.60"><vh>Generator.visit_Delete</vh></v>
<v t="ekr.20201219054931.61"><vh>Generator.visit_Dict</vh></v>
<v t="ekr.20201219054931.62"><vh>Generator.visit_DictComp</vh></v>
<v t="ekr.20201219054931.63"><vh>Generator.visit_Expr</vh></v>
<v t="ekr.20201219054931.64"><vh>Generator.visit_For</vh></v>
<v t="ekr.20201219054931.65"><vh>Generator.visit_FormattedValue</vh></v>
<v t="ekr.20201219054931.66"><vh>Generator.visit_AsyncFunctionDef</vh></v>
<v t="ekr.20201219054931.67"><vh>Generator.visit_FunctionDef</vh>
<v t="ekr.20201226150311.1"><vh>&lt;&lt; parse decorators &gt;&gt;</vh></v>
<v t="ekr.20201226145856.1"><vh>&lt;&lt; generate decorator &gt;&gt;</vh></v>
</v>
<v t="ekr.20201219054931.68"><vh>Generator.visit_GeneratorExp</vh></v>
<v t="ekr.20201219054931.69"><vh>Generator.visit_Global</vh></v>
<v t="ekr.20201219054931.70"><vh>Generator.visit_If</vh></v>
<v t="ekr.20201219054931.71"><vh>Generator.visit_IfExp</vh></v>
<v t="ekr.20201219054931.72"><vh>Generator.visit_Import</vh></v>
<v t="ekr.20201219054931.73"><vh>Generator.revisit_Import</vh></v>
<v t="ekr.20201219054931.74"><vh>Generator.visit_ImportFrom</vh></v>
<v t="ekr.20201219054931.75"><vh>Generator.revisit_ImportFrom</vh></v>
<v t="ekr.20201219054931.76"><vh>Generator.visit_JoinedStr</vh></v>
<v t="ekr.20201219054931.77"><vh>Generator.visit_Lambda</vh></v>
<v t="ekr.20201219054931.78"><vh>Generator.visit_List</vh></v>
<v t="ekr.20201219054931.79"><vh>Generator.visit_ListComp</vh></v>
<v t="ekr.20201219054931.80"><vh>Generator.visit_Module</vh></v>
<v t="ekr.20201219054931.81"><vh>Generator.visit_Name</vh></v>
<v t="ekr.20201219054931.82"><vh>Generator.visit_NameConstant</vh></v>
<v t="ekr.20201219054931.83"><vh>Generator.visit_Nonlocal</vh></v>
<v t="ekr.20201219054931.84"><vh>Generator.visit_Num</vh></v>
<v t="ekr.20201219054931.85"><vh>Generator.visit_Pass</vh></v>
<v t="ekr.20201219054931.86"><vh>Generator.visit_Raise</vh></v>
<v t="ekr.20201219054931.87"><vh>Generator.visit_Return</vh></v>
<v t="ekr.20201219054931.88"><vh>Generator.visit_Set</vh></v>
<v t="ekr.20201219054931.89"><vh>Generator.visit_SetComp</vh></v>
<v t="ekr.20201219054931.90"><vh>Generator.visit_Slice</vh></v>
<v t="ekr.20201219054931.91"><vh>Generator.visit_Str</vh></v>
<v t="ekr.20201219054931.92"><vh>Generator.visit_Subscript</vh></v>
<v t="ekr.20201219054931.93"><vh>Generator.visit_Try</vh></v>
<v t="ekr.20201219054931.94"><vh>Generator.visit_Tuple</vh></v>
<v t="ekr.20201219054931.95"><vh>Generator.visit_UnaryOp</vh></v>
<v t="ekr.20201219054931.96"><vh>Generator.visit_While</vh></v>
<v t="ekr.20201219054931.97"><vh>Generator.visit_With</vh></v>
<v t="ekr.20201219054931.98"><vh>Generator.visit_Yield</vh></v>
<v t="ekr.20201219054931.99"><vh>Generator.visit_YieldFrom</vh></v>
</v>
</v>
<v t="ekr.20201219054931.100"><vh>@@clean sourcemaps.py</vh>
<v t="ekr.20201219054931.101"><vh>&lt;&lt; imports &gt;&gt;</vh></v>
<v t="ekr.20201219054931.102"><vh>class Base64VlqConverter</vh>
<v t="ekr.20201219054931.103"><vh>Base64VlqConverter.__init__</vh></v>
<v t="ekr.20201219054931.104"><vh>Base64VlqConverter.encode</vh></v>
<v t="ekr.20201219054931.105"><vh>Base64VlqConverter.decode</vh></v>
</v>
<v t="ekr.20201219054931.106"><vh>class SourceMapper</vh>
<v t="ekr.20201219054931.107"><vh>SourceMapper.__init__</vh></v>
<v t="ekr.20201219054931.108"><vh>SourceMapper.generateAndSavePrettyMap</vh></v>
<v t="ekr.20201219054931.109"><vh>SourceMapper.cascadeAndSaveMiniMap</vh></v>
<v t="ekr.20201219054931.110"><vh>SourceMapper.loadShrinkMap</vh></v>
<v t="ekr.20201219054931.111"><vh>SourceMapper.save</vh></v>
<v t="ekr.20201219054931.112"><vh>SourceMapper.dumpMap</vh></v>
<v t="ekr.20201219054931.113"><vh>SourceMapper.dumpDeltaMap</vh></v>
<v t="ekr.20201219054931.114"><vh>SourceMapper.generateMultilevelMap</vh></v>
</v>
</v>
<v t="ekr.20201219054931.115"><vh>@@clean utils.py</vh>
<v t="ekr.20201219054931.117"><vh>class Any</vh>
<v t="ekr.20201219054931.118"><vh>Any.__init__</vh></v>
</v>
<v t="ekr.20201219054931.119"><vh>class CommandArgsError(BaseException)</vh></v>
<v t="ekr.20201219054931.120"><vh>class CommandArgsExit(BaseException)</vh></v>
<v t="ekr.20201219054931.121"><vh>class ArgumentParser(argparse.ArgumentParser)</vh>
<v t="ekr.20201219054931.122"><vh>ArgumentParser.error</vh></v>
<v t="ekr.20201219054931.123"><vh>ArgumentParser.exit</vh></v>
</v>
<v t="ekr.20201219054931.124"><vh>class CommandArgs</vh>
<v t="ekr.20201219054931.125"><vh>CommandArgs.parse</vh></v>
</v>
<v t="ekr.20201219054931.126"><vh>create</vh></v>
<v t="ekr.20201219054931.127"><vh>tryRemove</vh></v>
<v t="ekr.20201219054931.128"><vh>formatted</vh></v>
<v t="ekr.20201219054931.129"><vh>log</vh></v>
<v t="ekr.20201219054931.130"><vh>setProgram</vh></v>
<v t="ekr.20201219054931.131"><vh>class Error(Exception)</vh>
<v t="ekr.20201219054931.132"><vh>Error.__init__</vh></v>
<v t="ekr.20201219054931.133"><vh>Error.set</vh></v>
<v t="ekr.20201219054931.134"><vh>Error.__str__</vh></v>
</v>
<v t="ekr.20201219054931.135"><vh>enhanceException</vh></v>
<v t="ekr.20201219054931.136"><vh>digestJavascript</vh></v>
</v>
<v t="ekr.20201219054931.137"><vh>@@clean __builtin__.js</vh>
<v t="ekr.20201219061022.1"><vh>__call__</vh></v>
<v t="ekr.20201219061022.2"><vh>__kwargtrans__</vh></v>
<v t="ekr.20201219061022.3"><vh>__super__</vh></v>
<v t="ekr.20201219061023.1"><vh>property</vh></v>
<v t="ekr.20201219061023.2"><vh>__setproperty__</vh></v>
<v t="ekr.20201219061023.3"><vh>assert</vh></v>
<v t="ekr.20201219061309.1"><vh>__mergekwargtrans__ </vh></v>
<v t="ekr.20201219061309.2"><vh>__mergefields__</vh></v>
<v t="ekr.20201219061310.1"><vh>__withblock__</vh></v>
<v t="ekr.20201219061310.2"><vh>dir</vh></v>
<v t="ekr.20201219061310.3"><vh>setattr, getattr, hasattr, delattr</vh></v>
<v t="ekr.20201219061310.4"><vh>__in__</vh></v>
<v t="ekr.20201219061814.1"><vh>__specialattrib__</vh></v>
<v t="ekr.20201219061814.2"><vh>len</vh></v>
<v t="ekr.20201219062144.1"><vh>Type stuff...</vh>
<v t="ekr.20201219061814.3"><vh>__i__</vh></v>
<v t="ekr.20201219062158.1"><vh>__k__</vh></v>
<v t="ekr.20201219062158.2"><vh>__t__ (truthyness)</vh></v>
<v t="ekr.20201219062158.3"><vh>float &amp; int</vh></v>
<v t="ekr.20201219054931.138"><vh>Number.prototype.__format__</vh>
<v t="ekr.20201219054931.139"><vh>pad</vh></v>
<v t="ekr.20201219054931.140"><vh>format_float</vh></v>
</v>
<v t="ekr.20201219073300.1"><vh>bool</vh></v>
<v t="ekr.20201219073301.1"><vh>py_typeof</vh></v>
<v t="ekr.20201219073301.2"><vh>issubclass</vh></v>
<v t="ekr.20201219073411.1"><vh>isinstance</vh></v>
<v t="ekr.20201219073411.2"><vh>callable</vh></v>
</v>
<v t="ekr.20201219073411.3"><vh>repr, chr, ord</vh></v>
<v t="ekr.20201219073301.3"><vh>max, min, abs, round</vh></v>
<v t="ekr.20201219073525.1"><vh>format</vh></v>
<v t="ekr.20201219073625.1"><vh>Unified iterator model</vh>
<v t="ekr.20201219073525.2"><vh>__jsUsePyNext__ &amp; __pyUseJsNext__</vh></v>
<v t="ekr.20201219073525.3"><vh>py_iter</vh></v>
<v t="ekr.20201219073819.1"><vh>py_next</vh></v>
<v t="ekr.20201219073820.1"><vh>__PyIterator__</vh></v>
<v t="ekr.20201219054931.141"><vh>__PyIterator__.prototype.__next__ &amp; __JsIterator__</vh></v>
<v t="ekr.20201219054931.142"><vh>__JsIterator__.prototype.next</vh></v>
</v>
<v t="ekr.20201219062645.1"><vh>py_reversed</vh></v>
<v t="ekr.20201219062645.2"><vh>zip</vh></v>
<v t="ekr.20201219062646.1"><vh>range</vh></v>
<v t="ekr.20201219062646.2"><vh>any, all, sum</vh></v>
<v t="ekr.20201219062646.3"><vh>enumerate</vh></v>
<v t="ekr.20201219063107.1"><vh>copy, deepcopy</vh></v>
<v t="ekr.20201219063107.2"><vh>list</vh></v>
<v t="ekr.20201219063312.1"><vh>Array.prototype...</vh>
<v t="ekr.20201219054931.145"><vh>Array.prototype.__getslice__</vh></v>
<v t="ekr.20201219054931.146"><vh>Array.prototype.__setslice__</vh></v>
<v t="ekr.20201219054931.147"><vh>Array.prototype.__repr__</vh></v>
<v t="ekr.20201219054931.148"><vh>Array.prototype.append</vh></v>
<v t="ekr.20201219054931.149"><vh>Array.prototype.py_clear</vh></v>
<v t="ekr.20201219054931.150"><vh>Array.prototype.extend</vh></v>
<v t="ekr.20201219054931.151"><vh>Array.prototype.insert</vh></v>
<v t="ekr.20201219054931.152"><vh>Array.prototype.remove</vh></v>
<v t="ekr.20201219054931.153"><vh>Array.prototype.index</vh></v>
<v t="ekr.20201219054931.154"><vh>Array.prototype.py_pop</vh></v>
<v t="ekr.20201219054931.155"><vh>Array.prototype.py_sort</vh></v>
<v t="ekr.20201219054931.156"><vh>Array.prototype.__add__</vh></v>
<v t="ekr.20201219054931.157"><vh>Array.prototype.__mul__</vh></v>
<v t="ekr.20201219054931.158"><vh>Array.prototype.__bindexOf__</vh></v>
<v t="ekr.20201219054931.159"><vh>Array.prototype.add</vh></v>
<v t="ekr.20201219054931.160"><vh>Array.prototype.discard</vh></v>
<v t="ekr.20201219054931.161"><vh>Array.prototype.isdisjoint</vh></v>
<v t="ekr.20201219054931.162"><vh>Array.prototype.issuperset</vh></v>
<v t="ekr.20201219054931.163"><vh>Array.prototype.issubset</vh></v>
<v t="ekr.20201219054931.164"><vh>Array.prototype.union</vh></v>
<v t="ekr.20201219054931.165"><vh>Array.prototype.intersection</vh></v>
<v t="ekr.20201219054931.166"><vh>Array.prototype.difference</vh></v>
<v t="ekr.20201219054931.167"><vh>Array.prototype.symmetric_difference</vh></v>
<v t="ekr.20201219054931.168"><vh>Array.prototype.py_update</vh></v>
<v t="ekr.20201219054931.169"><vh>Array.prototype.__eq__</vh></v>
<v t="ekr.20201219054931.170"><vh>Array.prototype.__ne__</vh></v>
<v t="ekr.20201219054931.171"><vh>Array.prototype.__le__</vh></v>
<v t="ekr.20201219054931.172"><vh>Array.prototype.__ge__</vh></v>
<v t="ekr.20201219054931.173"><vh>Array.prototype.__lt__</vh></v>
<v t="ekr.20201219054931.174"><vh>Array.prototype.__gt__</vh></v>
</v>
<v t="ekr.20201219063343.1"><vh>bytearray &amp; bytes</vh></v>
<v t="ekr.20201219063457.1"><vh>Uint8Array...</vh>
<v t="ekr.20201219054931.175"><vh>Uint8Array.prototype.__add__</vh></v>
<v t="ekr.20201219054931.176"><vh>Uint8Array.prototype.__mul__ &amp; __rmul__</vh></v>
</v>
<v t="ekr.20201219074532.1"><vh>String extensions...</vh>
<v t="ekr.20201219063510.1"><vh>str</vh></v>
<v t="ekr.20201219054931.177"><vh>String.prototype.__repr__</vh></v>
<v t="ekr.20201219054931.178"><vh>String.prototype.__str__</vh></v>
<v t="ekr.20201219054931.179"><vh>String.prototype.capitalize</vh></v>
<v t="ekr.20201219054931.180"><vh>String.prototype.endswith</vh></v>
<v t="ekr.20201219054931.181"><vh>String.prototype.find</vh></v>
<v t="ekr.20201219054931.182"><vh>String.prototype.__getslice__</vh></v>
<v t="ekr.20201219054931.183"><vh>String.prototype.__format__</vh></v>
<v t="ekr.20201219063829.1"><vh>__setproperty__</vh></v>
<v t="ekr.20201219054931.187"><vh>String.prototype.isalnum</vh></v>
<v t="ekr.20201219054931.188"><vh>String.prototype.isalpha</vh></v>
<v t="ekr.20201219054931.189"><vh>String.prototype.isdecimal</vh></v>
<v t="ekr.20201219054931.190"><vh>String.prototype.isdigit</vh></v>
<v t="ekr.20201219054931.191"><vh>String.prototype.islower</vh></v>
<v t="ekr.20201219054931.192"><vh>String.prototype.isupper</vh></v>
<v t="ekr.20201219054931.193"><vh>String.prototype.isspace</vh></v>
<v t="ekr.20201219054931.194"><vh>String.prototype.isnumeric</vh></v>
<v t="ekr.20201219054931.195"><vh>String.prototype.join</vh></v>
<v t="ekr.20201219054931.196"><vh>String.prototype.lower</vh></v>
<v t="ekr.20201219054931.197"><vh>String.prototype.py_replace</vh></v>
<v t="ekr.20201219054931.198"><vh>String.prototype.lstrip</vh></v>
<v t="ekr.20201219054931.199"><vh>String.prototype.rfind</vh></v>
<v t="ekr.20201219054931.200"><vh>String.prototype.rsplit</vh></v>
<v t="ekr.20201219054931.201"><vh>String.prototype.rstrip</vh></v>
<v t="ekr.20201219054931.202"><vh>String.prototype.py_split</vh></v>
<v t="ekr.20201219054931.203"><vh>String.prototype.startswith</vh></v>
<v t="ekr.20201219054931.204"><vh>String.prototype.strip</vh></v>
<v t="ekr.20201219054931.205"><vh>String.prototype.upper</vh></v>
<v t="ekr.20201219054931.206"><vh>String.prototype.__mul__</vh></v>
</v>
<v t="ekr.20201219064825.1"><vh>Dict extensions to object</vh>
<v t="ekr.20201219054931.207"><vh>__contains__</vh></v>
<v t="ekr.20201219054931.208"><vh>__keys__</vh></v>
<v t="ekr.20201219054931.209"><vh>__items__</vh></v>
<v t="ekr.20201219054931.210"><vh>__del__</vh></v>
<v t="ekr.20201219054931.211"><vh>__clear__</vh></v>
<v t="ekr.20201219054931.212"><vh>__getdefault__</vh></v>
<v t="ekr.20201219054931.213"><vh>__setdefault__</vh></v>
<v t="ekr.20201219054931.214"><vh>__pop__</vh></v>
<v t="ekr.20201219054931.215"><vh>__popitem__</vh></v>
<v t="ekr.20201219054931.216"><vh>__update__</vh></v>
<v t="ekr.20201219054931.217"><vh>__values__</vh></v>
<v t="ekr.20201219054931.218"><vh>__dgetitem__</vh></v>
<v t="ekr.20201219054931.219"><vh>__dsetitem__</vh></v>
<v t="ekr.20201219064950.1"><vh>dict</vh></v>
<v t="ekr.20201219054931.220"><vh>__setdoc__</vh></v>
<v t="ekr.20201219065042.1"><vh>General operator overloading</vh>
<v t="ekr.20201219065216.1"><vh>Math operators (ifndef __xtiny__)</vh>
<v t="ekr.20201219065440.1"><vh>Overloaded binary ops</vh></v>
<v t="ekr.20201219065527.1"><vh>Overloaded bitwise ops</vh></v>
<v t="ekr.20201219065621.1"><vh>Overloaded binary compare</vh></v>
<v t="ekr.20201219065653.1"><vh>Overloaded augmented general</vh></v>
<v t="ekr.20201219065719.1"><vh>Overloaded augmented arithmetic</vh></v>
<v t="ekr.20201219070052.1"><vh>Overloaded augmented bitwise</vh></v>
<v t="ekr.20201219065746.1"><vh>Indices and slices</vh></v>
</v>
</v>
</v>
</v>
<v t="ekr.20201219054931.221"><vh>@@clean __core__.js</vh>
<v t="ekr.20201219070835.1"><vh>&lt;&lt; overview &gt;&gt;</vh></v>
<v t="ekr.20201219070811.1"><vh>__nest__</vh></v>
<v t="ekr.20201219070813.1"><vh>__init__</vh></v>
<v t="ekr.20201219070813.2"><vh>var __proxy__</vh></v>
<v t="ekr.20201219070814.1"><vh>__get__</vh></v>
<v t="ekr.20201219071110.1"><vh>__getcm__ &amp; __getsm__</vh></v>
<v t="ekr.20201219071113.1"><vh>var py_metatype (mother of all metaclasses)</vh></v>
<v t="ekr.20201219071113.2"><vh>var object (mother of all classes)</vh></v>
<v t="ekr.20201219071258.1"><vh>__class__ &amp; __pragma__</vh></v>
</v>
<v t="ekr.20201219054931.223"><vh>@@clean __envir__.js</vh></v>
<v t="ekr.20201219054931.224"><vh>@@clean __runtime__.py</vh>
<v t="ekr.20201227054945.1"><vh>Exception classes...</vh>
<v t="ekr.20201219054931.226"><vh>class BaseException</vh></v>
<v t="ekr.20201219054931.227"><vh>class Exception(BaseException)</vh>
<v t="ekr.20201219054931.228"><vh>Exception.__init__</vh></v>
<v t="ekr.20201219054931.229"><vh>Exception.__repr__</vh></v>
<v t="ekr.20201219054931.230"><vh>Exception.__str__</vh></v>
</v>
<v t="ekr.20201219054931.231"><vh>class IterableError(Exception)</vh>
<v t="ekr.20201219054931.232"><vh>IterableError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.233"><vh>class StopIteration(Exception)</vh>
<v t="ekr.20201219054931.234"><vh>StopIteration.__init__</vh></v>
</v>
<v t="ekr.20201219054931.235"><vh>class ValueError(Exception)</vh>
<v t="ekr.20201219054931.236"><vh>ValueError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.237"><vh>class KeyError(Exception)</vh>
<v t="ekr.20201219054931.238"><vh>KeyError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.239"><vh>class AssertionError(Exception)</vh>
<v t="ekr.20201219054931.240"><vh>AssertionError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.241"><vh>class NotImplementedError(Exception)</vh>
<v t="ekr.20201219054931.242"><vh>NotImplementedError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.243"><vh>class IndexError(Exception)</vh>
<v t="ekr.20201219054931.244"><vh>IndexError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.245"><vh>class AttributeError(Exception)</vh>
<v t="ekr.20201219054931.246"><vh>AttributeError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.247"><vh>class TypeError(Exception)</vh>
<v t="ekr.20201219054931.248"><vh>TypeError.__init__</vh></v>
</v>
<v t="ekr.20201219054931.249"><vh>class Warning(Exception)</vh></v>
<v t="ekr.20201219054931.250"><vh>class UserWarning(Warning)</vh></v>
<v t="ekr.20201219054931.251"><vh>class DeprecationWarning(Warning)</vh></v>
<v t="ekr.20201219054931.252"><vh>class RuntimeWarning(Warning)</vh></v>
</v>
<v t="ekr.20201219054931.253"><vh>__sort__</vh></v>
<v t="ekr.20201219054931.254"><vh>sorted</vh></v>
<v t="ekr.20201219054931.255"><vh>map</vh></v>
<v t="ekr.20201219054931.256"><vh>filter</vh></v>
<v t="ekr.20201219054931.257"><vh>divmod</vh></v>
<v t="ekr.20201219054931.258"><vh>complex numbers...</vh>
<v t="ekr.20201219054931.259"><vh>complex.__init__</vh></v>
<v t="ekr.20201219054931.260"><vh>complex.__neg__</vh></v>
<v t="ekr.20201219054931.261"><vh>complex.__exp__</vh></v>
<v t="ekr.20201219054931.262"><vh>complex.__log__</vh></v>
<v t="ekr.20201219054931.263"><vh>complex.__pow__</vh></v>
<v t="ekr.20201219054931.264"><vh>complex.__rpow__</vh></v>
<v t="ekr.20201219054931.265"><vh>complex.__mul__</vh></v>
<v t="ekr.20201219054931.266"><vh>complex.__rmul__</vh></v>
<v t="ekr.20201219054931.267"><vh>complex.__div__</vh></v>
<v t="ekr.20201219054931.268"><vh>complex.__rdiv__</vh></v>
<v t="ekr.20201219054931.269"><vh>complex.__add__</vh></v>
<v t="ekr.20201219054931.270"><vh>complex.__radd__</vh></v>
<v t="ekr.20201219054931.271"><vh>complex.__sub__</vh></v>
<v t="ekr.20201219054931.272"><vh>complex.__rsub__</vh></v>
<v t="ekr.20201219054931.273"><vh>complex.__repr__</vh></v>
<v t="ekr.20201219054931.274"><vh>complex.__str__</vh></v>
<v t="ekr.20201219054931.275"><vh>complex.__eq__</vh></v>
<v t="ekr.20201219054931.276"><vh>complex.__ne__</vh></v>
<v t="ekr.20201219054931.277"><vh>complex.conjugate</vh></v>
</v>
<v t="ekr.20201219054931.279"><vh>class __Terminal__ (print &amp; input)</vh>
<v t="ekr.20201219054931.280"><vh>__Terminal__.__init__</vh></v>
<v t="ekr.20201219054931.281"><vh>__Terminal__.print</vh></v>
<v t="ekr.20201219054931.282"><vh>__Terminal__.input</vh></v>
</v>
</v>
<v t="ekr.20201227054732.1"><vh>----- code generation</vh>
<v t="ekr.20201226145950.1"><vh>Found:allOwnNames</vh>
<v t="ekr.20201226145856.1"></v>
<v t="ekr.20201219054931.16"></v>
<v t="ekr.20201219054931.73"></v>
<v t="ekr.20201219054931.75"></v>
<v t="ekr.20201219054931.48"></v>
<v t="ekr.20201219054931.57"></v>
<v t="ekr.20201219054931.67"></v>
<v t="ekr.20201219054931.80"></v>
<v t="ekr.20201219054931.81"></v>
</v>
<v t="ekr.20201219054931.67"></v>
<v t="ekr.20201219054931.57"></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20201219054931.1">@language rest
@wrap

**Warnings**:

- Some files did not import correctly.
- I have revised __buitin__.js by hand.
- I have made some "editorial" changes to make reading easier.
  Most of these changes involve reducing line length.
  
**Overview**:

All of these are *major* pieces of engineering:

- class Generator(ast.NodeVisitor), in compiler.py.
  This class walks the Python parse tree, generating corresponding JS.
  
- __builtin__.js: Defines the "target" for the compiler.
  
- __core__.js: Defines global context for execution.

</t>
<t tx="ekr.20201219054931.10">def findPaths (self, filter):
    # Filter to get hyphens and/or dots in name if a suitable alias is defined
    # The filter function, and with it the active aliases, are passed by the importing module
    rawRelSourceSlug = self.name.replace ('.', '/')
    relSourceSlug = filter (rawRelSourceSlug) if filter and utils.commandArgs.alimod else rawRelSourceSlug

    '''
    # BEGIN DEBUGGING CODE
    print ()
    print ('Raw slug   :', rawRelSourceSlug)
    print ('Cooked slug:', relSourceSlug)
    print ()
    # END DEBUGGING CODE
    '''

    for searchDir in self.program.moduleSearchDirs:
        # Find source slugs
        sourceSlug = f'{searchDir}/{relSourceSlug}'
        if os.path.isdir (sourceSlug):
            self.sourceDir = sourceSlug
            self.sourcePrename = '__init__'
        else:
            self.sourceDir, self.sourcePrename = sourceSlug.rsplit ('/', 1)
        self.sourcePrepath = f'{self.sourceDir}/{self.sourcePrename}'
        self.pythonSourcePath = f'{self.sourcePrepath}.py'
        self.javascriptSourcePath = f'{self.sourcePrepath}.js'

        # Find target slugs
        self.targetPrepath = f'{self.program.targetDir}/{self.name}'
        self.targetName = f'{self.name}.js'
        self.targetPath = f'{self.targetPrepath}.js'
        self.prettyTargetName = f'{self.name}.pretty.js'
        self.prettyTargetPath = f'{self.targetPrepath}.pretty.js'
        self.importRelPath = f'./{self.name}.js'
        self.treePath = f'{self.targetPrepath}.tree'
        self.mapPath =  f'{self.targetPrepath}.map'
        self.prettyMapPath = f'{self.targetPrepath}.shrink.map'
        self.shrinkMapName = f'{self.name}.shrink.map'
        self.shrinkMapPath = f'{self.targetPrepath}.shrink.map'
        self.mapSourcePath = f'{self.targetPrepath}.py'
        self.mapRef = f'\n//# sourceMappingURL={self.name}.map'

        # If module exists
        if os.path.isfile (self.pythonSourcePath) or os.path.isfile (self.javascriptSourcePath):
            # Check if it's a JavaScript-only module
            self.isJavascriptOnly = os.path.isfile (self.javascriptSourcePath) and not os.path.isfile (self.pythonSourcePath)
            # Set more paths (tree, sourcemap, ...)
            # (To do)
            self.sourcePath = self.javascriptSourcePath if self.isJavascriptOnly else self.pythonSourcePath
            break

        # Remember all fruitless paths to give a decent error report if module isn't found
        # Note that this aren't all searched paths for a particular module,
        # since the difference between an module and a facility inside a module isn't always known a priori
        self.program.searchedModulePaths.extend ([self.pythonSourcePath, self.javascriptSourcePath])
    else:
        # If even the target can't be loaded then there's a problem with this module, root or not
        # However, loading a module is allowed to fail (see self.revisit_ImportFrom)
        # In that case this error is swallowed, but searchedModulePath is retained,
        # because searching in the swallowing except branch may also fail and should mention ALL searched paths
        raise utils.Error (
            message = '\n\tImport error, can\'t find any of:\n\t\t{}\n'.format ('\n\t\t'. join (self.program.searchedModulePaths))
        )

</t>
<t tx="ekr.20201219054931.100">@path transcrypt/modules/org/transcrypt/
&lt;&lt; imports &gt;&gt;
'''
A cascaded mini mapping is made as follows:
    - First generated a non-cascaded pretty map
    - After that have the minifier generate a shrink map and load that
    - After that cascade the two to obtain the mini map and save that
'''


@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20201219054931.101">import os
import math
import collections
import json
import shutil

from org.transcrypt import utils

</t>
<t tx="ekr.20201219054931.102"># Tools to embed source map info in target code

lineNrLength = 6
maxNrOfSourceLinesPerModule = 1000000


# Tools to encode and decode numbers as base 64 variable length quantities

class Base64VlqConverter:
    @others

base64VlqConverter = Base64VlqConverter ()
</t>
<t tx="ekr.20201219054931.103">def __init__ (self):
    self.encoding = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'  # Forward lookup table, from index to character, 64 symbols in total
    self.decoding = dict ((char, i) for i, char in enumerate (self.encoding))           # Enable reverse lookup, so from character to index
    
    self.prefabSize = 256                                                               # The 256 most used vlq's are prefabricated
    self.prefab = [self.encode ([i], True) for i in range (self.prefabSize)]

</t>
<t tx="ekr.20201219054931.104">def encode (self, numbers, init = False):
    segment = ''
    for number in numbers:
        if not init and 0 &lt; number &lt; self.prefabSize:
            field = self.prefab [number]
        else:
            signed = bin (abs (number)) [2 : ] + ('1' if number &lt; 0 else '0')           # Convert to binary, chop off '0b' and append sign bit
            nChunks = math.ceil (len (signed) / 5.0)                                    # Determine minimum nr of needed 5 bit chunks (2 ^ 5 == 32)
            padded = (5 * '0' + signed) [-nChunks * 5 : ]                               # Pad by prepending zeroes to fit integer nr of chunks
            chunks = [
                ('1' if iChunk else '0') + padded [                                     # Prefix first chunk with 0, continuation chunks with 1 (continuation bit)
                    iChunk * 5 : (iChunk + 1) * 5                                       # Pick out a not yet prefixed chunk from the padded bits 
                ] 
                for iChunk in range (nChunks - 1, -1, -1)                               # Reverse chunks, so the chunk starting with 0 will be last, first has sign bit
            ]                                                                           # So encountering a chunk with int value &lt; 32 will denote end of number
            field = ''.join ([self.encoding [int (chunk, 2)] for chunk in chunks])      # Convert each chunk, incl. continuation bit to its encoding
        segment += field
    return segment

</t>
<t tx="ekr.20201219054931.105">def decode (self, segment):
    numbers = []
    accu = 0
    weight = 1

    for char in segment:
        ordinal = self.decoding [char]
        isContinuation = ordinal &gt;= 32
        
        if isContinuation:
            ordinal -=32                                                                # Reset continuation bit
            
        if weight == 1:                                                                 # It was the tail of a number
            sign = -1 if ordinal % 2 else 1                                             # Remember sign
            ordinal //= 2                                                               # Remove sign bit, no matter what it was
            
        accu += weight * ordinal                                                        # Add new ordinal as currently least significant
        
        if isContinuation:                                                              # If it's a continuation
            if weight == 1:                                                             #   If it's the first continuation it will have the sign bit
                weight = 16                                                             #       So next weight is 16
            else:                                                                       #   Else it won't have the sign bit:
                weight *= 32                                                            #       So next weight * 32
        else:                                                                           # Else  ('no continuation' means 'end of number', since chunks are reversed)
            numbers.append (sign * accu)                                                #   Append accumulated number to results
            accu = 0                                                                    #   Reset accumulator for next number
            weight = 1                                                                  #   Reset weight, next number will again start with least significant part
            
    return numbers
    
</t>
<t tx="ekr.20201219054931.106"># Tools to create and combine sourcemaps

mapVersion = 3
iTargetLine, iTargetColumn, iSourceIndex, iSourceLine, iSourceColumn = range (5)
    # Line indexes rather than line numbers are stored  

class SourceMapper: # There's only one sourcemapper needed to generate all maps of a module
    @others
</t>
<t tx="ekr.20201219054931.107">def __init__ (
    self,
    moduleName,
    targetDir,
    minify,
    dump
):
    self.moduleName = moduleName
    self.targetDir = targetDir
    self.minify = minify
    self.dump = dump
    
</t>
<t tx="ekr.20201219054931.108">def generateAndSavePrettyMap (self, sourceLineNrs):
    self.prettyMappings = [[targetLineIndex, 0, 0, sourceLineNr - 1, 0] for targetLineIndex, sourceLineNr in enumerate (sourceLineNrs)]
    self.prettyMappings.sort ()
    
    infix = '.pretty'  if self.minify else ''
    
    self.save (self.prettyMappings, infix)
    
    if self.dump:
        self.dumpMap (self.prettyMappings, infix, '.py')
        self.dumpDeltaMap (self.prettyMappings, infix)
        
</t>
<t tx="ekr.20201219054931.109">def cascadeAndSaveMiniMap (self):
    def getCascadedMapping (shrinkMapping):                                 # N.B. self.prettyMappings has to be sorted in advance
        prettyMapping = self.prettyMappings [min (shrinkMapping [iSourceLine], len (self.prettyMappings) - 1)] 
        
        result =            (
            shrinkMapping [ : iTargetColumn + 1]                            # Target location from shrink mapping
            +
            prettyMapping [iSourceIndex : ]                                 # Source location from self
        )
        if self.dump:
            self.cascadeMapdumpFile.write ('{} {} {}\n'.format (result, shrinkMapping, prettyMapping))
        return result
    
    if self.dump:
        self.cascadeMapdumpFile = utils.create (f'{self.targetDir}/{self.moduleName}.cascade_map_dump')
    
    self.miniMappings = [
        getCascadedMapping (shrinkMapping)
        for shrinkMapping in self.shrinkMappings
    ]
    self.miniMappings.sort ()
    
    self.save (self.miniMappings, '')
    
    if self.dump:
        self.cascadeMapdumpFile.close ()
    
</t>
<t tx="ekr.20201219054931.11">def generateJavascriptAndPrettyMap (self):
    utils.log (False, 'Generating code for module: {}\n', self.targetPath)

    # Generate target fragments
    self.generator = Generator (self)

    # Fabricate target lines from target fragments
    if utils.commandArgs.map or utils.commandArgs.anno:
        # In both cases the generator will have instrumented the target fragments by appending line numbers
        # N.B. __pragma__ ('noanno') will be too late to prevent instrumenting of the main module's first line
        # In that case if no source maps are required either, the appended line numbers simply won't be used

        # Split joined fragments into (instrumented) lines
        instrumentedTargetLines = ''.join (self.generator.targetFragments) .split ('\n')

        # Only remember source line nrs if a map is to be generated (so not if only annotated JavaScript is needed)
        if utils.commandArgs.map:
            self.sourceLineNrs = []

        # Split instrumentedTargetLines in (bare) targetLines and sourceLineNrs, skipping empty statements
        targetLines = []
        for targetLine in instrumentedTargetLines:
            # The actual splitting
            sourceLineNrString = targetLine [-sourcemaps.lineNrLength : ]                           # Take the appended line number, e.g. the string '000014'
            sourceLineNr = int ('1' + sourceLineNrString) - sourcemaps.maxNrOfSourceLinesPerModule  # Turn it into an integer, e.g. 14
            targetLine = targetLine [ : -sourcemaps.lineNrLength]                                   # Obtain non-instrumented line by removing the appended line number

            # Only append non-emptpy statements and their number info
            if targetLine.strip () != ';':                                                          # If the non-instrumented line isn't empty
                if self.generator.allowDebugMap:                                                         # If annotations comments have to be prepended
                    targetLine = '/* {} */ {}'.format (sourceLineNrString, targetLine)              # Prepend them
                targetLines.append (targetLine)                                                     # Add the target line, with or without prepended annotation comment

                # Store line nrs for source map
                if utils.commandArgs.map:
                    self.sourceLineNrs.append (sourceLineNr)                                        # Remember its line number to be able to generate a sourcemap

        # Generate per module sourcemap and copy sourcefile to target location
        if utils.commandArgs.map:
            utils.log (False, 'Saving source map in: {}\n', self.mapPath)
            self.sourceMapper.generateAndSavePrettyMap (self.sourceLineNrs)
            shutil.copyfile (self.sourcePath, self.mapSourcePath)
    else:
        # No maps or annotations needed, so this 'no stripping' shortcut for speed
        targetLines = [line for line in  ''.join (self.generator.targetFragments) .split ('\n') if line.strip () != ';']

    self.targetCode = '\n'.join (targetLines)

</t>
<t tx="ekr.20201219054931.110">def loadShrinkMap (self):
    with open  (f'{self.targetDir}/{self.moduleName}.shrink.map') as mapFile:
        rawMap = json.loads (mapFile.read ())
            
    deltaMappings = [
        [base64VlqConverter.decode (segment) for segment in group.split (',')]
        for group in rawMap ['mappings'] .split (';')
    ]
    
    '''
    Fields in a delta segment as directly decoded from the output of the minifier:
      index (target line index implicit, is group index)
        0: target column index
        1: source file index        (optional)      (always zero)
        2: source line index        (optional)
        3: source column index      (optional)
        4: name index               (optional)
        
    Fields in a shrinkMapping:
      index
        0: target line index (is group index, a group represents a target line)
        1: target column index
        2: source file index        (always zero)   (i = 1)
        3: source line index                        (i = 2)
        4: source column index                      (i = 3)
        5: source name index        (left out)
    '''
    
    self.shrinkMappings = []
    for groupIndex, deltaGroup in enumerate (deltaMappings):
        for segmentIndex, deltaSegment in enumerate (deltaGroup):
            if deltaSegment:                                                    # Shrink map ends with empty group, i.e. 'holding empty segment'
                if segmentIndex:
                    self.shrinkMappings.append ([groupIndex, deltaSegment [0] + self.shrinkMappings [-1][1]])
                else:                                                           # Start of group
                    self.shrinkMappings.append ([groupIndex, deltaSegment [0]]) # Absolute target column
                    
                for i in range (1, 4):                                          # So i in [1, 2, 3]
                    if groupIndex or segmentIndex:
                        self.shrinkMappings [-1] .append (deltaSegment [i] + self.shrinkMappings [-2][i + 1])
                    else:                                                       # Start of map
                        try:
                            self.shrinkMappings [-1] .append (deltaSegment [i]) # Absolut file index, source line and source column
                        except:                                                 # Shrink map starts with 'A' rather than 'AAAA'
                            self.shrinkMappings [-1] .append (0)                       
    self.shrinkMappings.sort () # Sort on target line and inside that on target column
                            
    if self.dump:
        self.dumpMap (self.shrinkMappings, '.shrink', '.py')
        self.dumpDeltaMap (deltaMappings, '.shrink')
        
</t>
<t tx="ekr.20201219054931.111">def save (self, mappings, infix):
    deltaMappings = []
    oldMapping = [-1, 0, 0, 0, 0]
    for mapping in mappings:
        newGroup = mapping [iTargetLine] != oldMapping [iTargetLine]
        
        if newGroup:
            deltaMappings.append ([])                                                              # Append new group
            
        deltaMappings [-1] .append ([])                                                            # Append new segment, one for each mapping
        
        if newGroup:
            deltaMappings [-1][-1] .append (mapping [iTargetColumn])                               # Only target column reset for every group
        else:
            deltaMappings [-1][-1] .append (mapping [iTargetColumn] - oldMapping [iTargetColumn])  # Others are delta's, so cumulative
                
        for i in [iSourceIndex, iSourceLine, iSourceColumn]:
            deltaMappings [-1][-1] .append (mapping [i] - oldMapping [i])
                
        oldMapping = mapping
                                
    rawMap = collections.OrderedDict ([
        ('version', mapVersion),
        ('file', f'{self.moduleName}.js'), # Target
        ('sources', [f'{self.moduleName}{infix}.py']),
        # ('sourcesContent', [None]),
        ('mappings', ';'.join ([
            ','.join ([
                base64VlqConverter.encode (segment)
                for segment in group
            ])
            for group in deltaMappings
        ]))
    ])
            
    with utils.create (f'{self.targetDir}/{self.moduleName}{infix}.map') as mapFile:
        mapFile.write (json.dumps (rawMap, indent = '\t'))
        
    if self.dump:
        self.dumpMap (mappings, infix, '.py')
        self.dumpDeltaMap (deltaMappings, infix)
        
</t>
<t tx="ekr.20201219054931.112">def dumpMap (self, mappings, infix, sourceExtension):
    with utils.create (f'{self.targetDir}/{self.moduleName}{infix}.map_dump') as mapdumpFile:
        mapdumpFile.write (f'mapVersion: {mapVersion}\n\n')
        mapdumpFile.write (f'targetPath: {self.moduleName}.js\n\n')
        mapdumpFile.write (f'sourcePath: {self.moduleName}{infix}{sourceExtension}\n\n')
        mapdumpFile.write ('mappings:\n')
        for mapping in mappings:
            mapdumpFile.write ('\t{}\n'.format (mapping))
            
</t>
<t tx="ekr.20201219054931.113">def dumpDeltaMap (self, deltaMappings, infix):
    with utils.create (f'{self.targetDir}/{self.moduleName}{infix}.delta_map_dump') as deltaMapdumpFile:
        for group in deltaMappings:
            deltaMapdumpFile.write ('(New group) ')
            for segment in group:
                deltaMapdumpFile.write ('Segment: {}\n'.format (segment))
                            
</t>
<t tx="ekr.20201219054931.114">def generateMultilevelMap (self):
    utils.log (False, 'Saving multi-level sourcemap in: {}\n') # !!!     , 'self.mapPath')
    self.loadShrinkMap ()
    self.cascadeAndSaveMiniMap ()
    
</t>
<t tx="ekr.20201219054931.115">@path transcrypt/modules/org/transcrypt/
import os
import sys
import argparse
import inspect
import tokenize
import re
import time

defaultJavaScriptVersion = 5

@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20201219054931.117">class Any:
    @others

</t>
<t tx="ekr.20201219054931.118">def __init__ (self, **attribs):
    for attrib in attribs:
        setattr (self, attrib, attribs [attrib])

</t>
<t tx="ekr.20201219054931.119">class CommandArgsError (BaseException):
    pass
    
</t>
<t tx="ekr.20201219054931.12">def loadJavascript (self):
    with tokenize.open (self.sourcePath) as sourceFile:
        self.targetCode = sourceFile.read ()

</t>
<t tx="ekr.20201219054931.120">class CommandArgsExit (BaseException):
    pass
    
</t>
<t tx="ekr.20201219054931.121">class ArgumentParser (argparse.ArgumentParser):
    @others
</t>
<t tx="ekr.20201219054931.122">def error (self, message):
    self.print_help (sys.stdout)
    if message:
        log (True, '\nError: {}\n', message)
    raise CommandArgsError ()
    
</t>
<t tx="ekr.20201219054931.123">def exit (self, status = 0, message = None):
    if message:
        log (True, 'Exit: {}', message)
    raise CommandArgsExit ()

</t>
<t tx="ekr.20201219054931.124">class CommandArgs:
    @others

commandArgs = CommandArgs ()
   
</t>
<t tx="ekr.20201219054931.125">def parse (self):
    self.argParser = ArgumentParser ()
    
    self.argParser.add_argument ('source', nargs='?', help = ".py file containing source code of main module")
    self.argParser.add_argument ('-a', '--anno', help = "annotate target files that were compiled from Python with source file names and source line numbers", action = 'store_true')
    self.argParser.add_argument ('-am', '--alimod', help = "use aliasing for module paths", action = 'store_true')
    self.argParser.add_argument ('-b', '--build', help = "rebuild all target files from scratch", action = 'store_true')
    self.argParser.add_argument ('-c', '--complex', help = "enable complex number support, locally requires operator overloading", action = 'store_true')
    self.argParser.add_argument ('-d', '--docat', help = "enable __doc__ attributes. Apply sparsely, since it will make docstrings part of the generated code", action = 'store_true')
    self.argParser.add_argument ('-da', '--dassert', help = "debug: activate assertions", action = 'store_true')
    self.argParser.add_argument ('-dc', '--dcheck', help = "debug: perform lightweight consistency check", action = 'store_true')
    self.argParser.add_argument ('-de', '--dextex', help = "debug: show extended exception reports", action = 'store_true')
    self.argParser.add_argument ('-dl', '--dlog', help = "debug: log compiler messages to disk", action = 'store_true')
    self.argParser.add_argument ('-dm', '--dmap', help = "debug: dump human readable source map", action = 'store_true')
    self.argParser.add_argument ('-dn', '--dnostrip', help = "debug: no comment stripping of __core__ and __builtin__ in-line modules", action = 'store_true')
    self.argParser.add_argument ('-ds', '--dstat', help = "debug: validate static typing using annotations", action = 'store_true')
    self.argParser.add_argument ('-dt', '--dtree', help = "debug: dump syntax tree", action = 'store_true')
    self.argParser.add_argument ('-e', '--esv', nargs='?', help = "ecma script version of generated code, default = 6. The symbol __esv&lt;versionnr&gt;__ is added to the global symbol list, e.g. __esv7__.")
    self.argParser.add_argument ('-ec', '--ecom', help = "enable executable comments, seen as comments by CPython but as executable statements by Transcrypt", action = 'store_true')
    self.argParser.add_argument ('-f', '--fcall', help = "enable fastcall mechanism by default. You can also use __pragma__ ('fcal') and __pragma__ (\'nofcall\')", action = 'store_true')
    self.argParser.add_argument ('-g', '--gen', help = "enable generators and iterators. Disadvised, since it will result in a function call for each loop iteration. Preferably use __pragma__ ('gen') and __pragma__ ('nogen')", action = 'store_true')
    self.argParser.add_argument ('-i', '--iconv', help = "enable automatic conversion to iterable by default. Disadvised, since it will result in a type check for each for-loop. Preferably use __pragma__ ('iconv') and __pragma__ (\'noiconv\') to enable automatic conversion locally", action = 'store_true')
    self.argParser.add_argument ('-jc', '--jscall', help = "enable native JavaScript calls for Python methods. This is fast, but doesn't support bound method assignment, decorators and non-instance methods. Preferably use __pragma__ ('jscall') and __pragma__ ('nojscall') to enable native JavaScript calls locally", action = 'store_true')
    self.argParser.add_argument ('-jk', '--jskeys', help = "interpret {key: 'value'} as {'key': 'value'} and forbid {key (): 'value'}, as JavaScript does. Disadvised, since it's less flexible than the Python interpretation. Either follow Python semantics by using {'key': 'value'} explicitly if you want literal keys or use __pragma__ ('jskeys') and __pragma__ ('nojskeys') locally instead to make clear local deviation from Python semantics", action = 'store_true')
    self.argParser.add_argument ('-jm', '--jsmod', help = "give %% and %%= JavaScript rather than Python behaviour. Disadvised, since it deviates from the mathematical 'modulo' operator. Either follow Python semantics or use __pragma__ ('jsmod') and __pragma__ ('nojsmod') locally instead to make clear local deviation.", action = 'store_true')
    self.argParser.add_argument ('-k', '--kwargs', help = "enable keyword arguments by default. In general this is disadvised, use __pragma__ ('kwargs') and __pragma__('nokwargs') locally instead to prevent bloated code", action = 'store_true')
    self.argParser.add_argument ('-kc', '--keycheck', help = "enable checking for existence of dictionary keys. In general this is disadvised, use __pragma__ ('keycheck') and __pragma__('nokeycheck') locally instead to prevent bloated code", action = 'store_true')
    self.argParser.add_argument ('-l', '--license', help = "show license", action = 'store_true')
    self.argParser.add_argument ('-m', '--map', help = "generate source map", action = 'store_true')
    self.argParser.add_argument ('-n', '--nomin', help = "no minification", action = 'store_true')
    self.argParser.add_argument ('-o', '--opov', help = "enable operator overloading by default. In general this is disadvised, use __pragma__ ('opov') and __pragma__('noopov') locally instead to prevent slow code", action = 'store_true')
    self.argParser.add_argument ('-p', '--parent', nargs='?', help = "object that will hold application, default is window. Use -p .none to generate orphan application, e.g. for use in node.js")
    self.argParser.add_argument ('-r', '--run', help = "run source file rather than compiling it", action = 'store_true')
    self.argParser.add_argument ('-s', '--symbols', nargs='?', help = "names, joined by $, separately passed to main module in __symbols__ variable")
    self.argParser.add_argument ('-sf', '--sform', help = "enable support for string formatting mini language", action = 'store_true')
    self.argParser.add_argument ('-t', '--tconv', help = "enable automatic conversion to truth value by default. Disadvised, since it will result in a conversion for each boolean. Preferably use __pragma__ ('tconv') and __pragma__ (\'notconv\') to enable automatic conversion locally", action = 'store_true')
    self.argParser.add_argument ('-u', '--unit', nargs='?', help = "compile to units rather than to monolithic application. Use -u .auto to autogenerate dynamically loadable native JavaScript modules, one per Python module. Use -u .run to generate the loader and the staticcally loadable runtime unit. Use -u .com to generate a statically loadable component unit.")
    self.argParser.add_argument ('-v', '--verbose', help = "show all messages", action = 'store_true')
    self.argParser.add_argument ('-x', '--x', help = "reserved for extended options")
    self.argParser.add_argument ('-xr', '--xreex', help = "re-export all imported names", action = 'store_true')
    self.argParser.add_argument ('-xg', '--xglobs', help = "allow use of the 'globals' function", action = 'store_true')
    self.argParser.add_argument ('-xp', '--xpath', nargs = '?', help = "additional module search paths, joined by $, #'s will be replaced by spaces")
    self.argParser.add_argument ('-xt', '--xtiny', help = "generate tiny version of runtime, a.o. lacking support for implicit and explicit operator overloading. Use only if generated code can be validated, since it will introduce semantic alterations in edge cases", action = 'store_true')
    self.argParser.add_argument ('-*', '--star', help = "Like it? Grow it! Go to GitHub and then click [* Star]", action = 'store_true')
    
    self.projectOptions = self.argParser.parse_args () .__dict__
    self.__dict__.update (self.projectOptions)
    
    # Signal invalid switches
    
    def logAndExit (message):
        log (True, message)
        sys.exit (1)
    
    invalidCombi = 'Invalid combination of options'
    
    if not (self.license or self.star or self.source):
        logAndExit (self.argParser.format_usage () .capitalize ())
    elif self.map and self.unit:
        logAndExit ('{}: -m / --map and -u / --unit'.format (invalidCombi))   
    elif self.parent and self.unit == '.com':
        logAndExit ('{}: -p / --parent and -u / --unit .com'.format (invalidCombi))
    elif self.parent == '.export' and self.esv and int (self.esv) &lt; 6:
        logAndExit ('{}: -p / --parent .export and -e / --esv &lt; 6'.format (invalidCombi))        
    elif self.unit == '.auto' and self.esv and int (self.esv) &lt; 6:
        logAndExit ('{}: -u / --unit .auto and -e / --esv &lt; 6'.format (invalidCombi))
    
    # Set dependent switches
    
    # (for future use)
        
    # Correcting line counts for source map
        
    global extraLines
    extraLines = [
        # Make identifier __pragma__ known to static checker
        # It was only known in JavaScript from __core__.js, which the checker doesn't see
        # __ pragma__ ('&lt;all&gt;') in JavaScript requires it to remain a function, as it was in the core
        # It can't be skipped, since it has to precede __pragma__ ('skip'), to make the checker accept that
        'def __pragma__ (): pass',
    
        # Make __include__ known to the static checker
        '__pragma__ (\'skip\')',            
        '__new__ = __include__ = 0',    
        '__pragma__ (\'noskip\')',
        ''
    ] if commandArgs.dcheck else []
    global nrOfExtraLines
    nrOfExtraLines = max (len (extraLines) - 1, 0)  # Last line only serves to force linefeed
    extraLines = '\n'.join (extraLines)
    
</t>
<t tx="ekr.20201219054931.126">def create (path, binary = False):
    for i in range (10):
        try:
            os.makedirs (os.path.dirname (path), exist_ok = True)
            
            if binary:
                return open (path, 'wb')
            else:
                return open (path, 'w', encoding = 'utf-8')
                
            if i &gt; 0:
                log (True, f'Created {path} at attempt {i + 1}')
                
        except:
            time.sleep (0.5)
    else:
        raise Error (f'Failed to create {path}')
</t>
<t tx="ekr.20201219054931.127">def tryRemove (filePath):
    try:
        os.remove (filePath)
    except:
        pass
</t>
<t tx="ekr.20201219054931.128">def formatted (*args):  # args [0] is string, args [1 : ] are format params
    try:
        return str (args [0]) .format (*args [1 : ])
    except IndexError:  # Tuple index out of range in format tuple
        return ' '.join (args)
   
logFileName = 'transcrypt.log'  # ... Use envir.transpiler_name
   
try:
    os.remove (logFileName)
except: # Assume logfile doesn't yet exist
    pass
</t>
<t tx="ekr.20201219054931.129">def log (always, *args):
    if always or commandArgs.verbose:
        print (formatted (*args), end = '')
        try:
            if commandArgs.dlog:
                with open (logFileName, 'a') as logFile:
                    logFile.write (formatted (*args))
         
        except: # Assume too early, commandArgs not yet set
            pass
</t>
<t tx="ekr.20201219054931.13">def parse (self):
    def pragmasFromComments (sourceCode):
        # This function turns comment-like pragma's into regular ones, both for multi-line and single-line pragma's
        # It changes rather than regenerates the sourcecode, since tokenize/untokenize will mess up formatting
        # Single line pragma's are always comment-like and will be turned into multi-line function-like pragma's
        # Also in this function executable comments are converted to normal code 

        # Tokenize the source code, to be able to recognize comments easily
        tokens = tokenize.tokenize (io.BytesIO (sourceCode.encode ('utf-8')) .readline)

        # Store all line indices of comment-like pragma's, multi-line and single-line in separate lists
        pragmaCommentLineIndices = []
        shortPragmaCommentLineIndices = []
        ecomPragmaLineIndices = []
        noecomPragmaLineIndices = []
        pragmaIndex = -1000
        for tokenIndex, (tokenType, tokenString, startRowColumn, endRowColumn, logicalLine) in enumerate (tokens):
            if tokenType == tokenize.COMMENT:
                strippedComment = tokenString [1 : ] .lstrip ()
                if  strippedComment.startswith ('__pragma__'):
                
                   # Remember line index of multi-line pragma, like: # __pragma__ (...
                    pragmaCommentLineIndices.append (startRowColumn [0] - 1)
                elif strippedComment.replace (' ', '') .replace ('\t', '') .startswith ('__:'):
                
                    # Remember line index of single-line pragma, like: &lt;some code&gt; # __: ...
                    shortPragmaCommentLineIndices.append (startRowColumn [0] - 1)
            if tokenType == tokenize.NAME and tokenString == '__pragma__':
                pragmaIndex = tokenIndex
                
            if tokenIndex - pragmaIndex == 2:
                pragmaKind = tokenString [1:-1]
                if pragmaKind == 'ecom':
                    ecomPragmaLineIndices.append (startRowColumn [0] - 1)
                elif pragmaKind == 'noecom':
                    noecomPragmaLineIndices.append (startRowColumn [0] - 1)

        # Convert original, non-tokenized sourcecode to a list of lines
        sourceLines = sourceCode.split ('\n')
        
        # Use line indices of multi-line function-like ecom / noecom pragma's to transform these lines into executable comment switches
        for ecomPragmaLineIndex in ecomPragmaLineIndices:
            sourceLines [ecomPragmaLineIndex] = ecom
        for noecomPragmaLineIndex in noecomPragmaLineIndices:
            sourceLines [noecomPragmaLineIndex] = noecom
                    
        # Use line indices of multi-line comment-like pragma singles to transform these into function-like pragma singles (which often turn out te be part of a matching pair)
        allowExecutableComments = utils.commandArgs.ecom
        for pragmaCommentLineIndex in pragmaCommentLineIndices:
            indentation, separator, tail = sourceLines [pragmaCommentLineIndex] .partition ('#')
            pragma, separator, comment = tail.partition ('#')
            pragma = pragma.replace (' ', '') .replace ('\t', '')
            
            # Turn appropriate lines into executable comment switches
            if "('ecom')" in pragma or '("ecom")' in pragma:
                allowExecutableComments = True
                sourceLines [pragmaCommentLineIndex] = ecom
            elif "('noecom')" in pragma or '("noecom")' in pragma:
                allowExecutableComments = False
                sourceLines [pragmaCommentLineIndex] = noecom
            else:
                sourceLines [pragmaCommentLineIndex] = indentation + tail.lstrip ()

        # Use line indices of single-line comment-like pragma's to transform these into function-like pragma pairs
        for shortPragmaCommentLineIndex in shortPragmaCommentLineIndices:
            head, tail = sourceLines [shortPragmaCommentLineIndex] .rsplit ('#', 1)
            strippedHead = head.lstrip ()
            indent = head [ : len (head) - len (strippedHead)]
            pragmaName = tail.replace (' ', '') .replace ('\t', '') [3:]
            
            # Turn appropriate lines into executable comment switches
            if pragmaName == 'ecom':
                sourceLines [pragmaCommentLineIndex] = ecom             
            elif pragmaName == 'noecom':
                sourceLines [pragmaCommentLineIndex] = noecom                
            elif pragmaName.startswith ('no'):
                sourceLines [shortPragmaCommentLineIndex] = '{}__pragma__ (\'{}\'); {}; __pragma__ (\'{}\')' .format (indent, pragmaName, head, pragmaName [2:])    # Correct!
            else:
                sourceLines [shortPragmaCommentLineIndex] = '{}__pragma__ (\'{}\'); {}; __pragma__ (\'no{}\')' .format (indent, pragmaName, head, pragmaName)
                
        # Switch executable comments on c.q. off and turn executable comments into normal code lines for Transcrypt (as opposed to CPython)
        uncommentedSourceLines = []
        for sourceLine in sourceLines:
            if sourceLine == ecom:
                allowExecutableComments = True
            elif sourceLine == noecom:
                allowExecutableComments = False
            elif allowExecutableComments:
                lStrippedSourceLine = sourceLine.lstrip ()
                if not lStrippedSourceLine [:4] in {"'''?", "?'''", '"""?', '?"""'}:
                    uncommentedSourceLines.append (sourceLine.replace ('#?', '', 1) if lStrippedSourceLine.startswith ('#?') else sourceLine)
            else:
                uncommentedSourceLines.append (sourceLine)
                
        # Return joined lines, to be used for parsing
        return '\n'.join (uncommentedSourceLines)

    try:
        utils.log (False, 'Parsing module: {}\n', self.sourcePath)

        with tokenize.open (self.sourcePath) as sourceFile:
            self.sourceCode = utils.extraLines + sourceFile.read ()
            
        self.parseTree = ast.parse (pragmasFromComments (self.sourceCode))

        for node in ast.walk (self.parseTree):
            for childNode in ast.iter_child_nodes (node):
                childNode.parentNode = node

    except SyntaxError as syntaxError:
        utils.enhanceException (
            syntaxError,
            lineNr = syntaxError.lineno,
            message = (
                    '\n\t{} [&lt;-SYNTAX FAULT] {}'.format (
                        syntaxError.text [:syntaxError.offset].lstrip (),
                        syntaxError.text [syntaxError.offset:].rstrip ()
                    )
                if syntaxError.text else
                    syntaxError.args [0]
            )
        )

</t>
<t tx="ekr.20201219054931.130">program = None

def setProgram (aProgram):
    global program
    program = aProgram
         
</t>
<t tx="ekr.20201219054931.131">class Error (Exception):
    # First error encountered counts, for all fields, because it's closest to the cause of trouble
    # One error at a time, just like Python, clear and simple
    # The error object contains the import trail, the error line number and the error message

    @others
</t>
<t tx="ekr.20201219054931.132">def __init__ (self, lineNr = 0, message = ''):
    self.lineNr = lineNr - nrOfExtraLines
    self.message = message
    # The name of the module and of its import trail is known from the import stack, so no need to pass it as a parameter
    
</t>
<t tx="ekr.20201219054931.133">def set (self, lineNr = 0, message = ''):          
    if not self.lineNr:
        self.lineNr = lineNr - nrOfExtraLines
        
    if not self.message:
        self.message = message
        
</t>
<t tx="ekr.20201219054931.134">def __str__ (self):
    result = 'Error while compiling (offending file last):'

    # Successively report each module in the import trail, "oldest" first, except the one that caused the error
    for importRecord in program.importStack [ : -1]:
        try:
            sourcePath = importRecord [0] .sourcePath
        except:
            sourcePath = '&lt;unknown&gt;'
        result += '\n\tFile \'{}\', line {}, at import of:'.format (sourcePath, importRecord [1])
    
    # After that, report the module and line that caused the error
    result += '\n\tFile \'{}\', line {}, namely:'.format (str (program.importStack [-1][0] .name), self.lineNr)
    
    # And, lastly, report the error message
    result += '\n\t{}'.format (self.message)
    return result
    
</t>
<t tx="ekr.20201219054931.135">def enhanceException (exception, **kwargs):
    # If not all required info, such as a line number, is available at the location where the exception was raised,
    # it is enhanced later on by adding this missing info at the earliest occasion

    if isinstance (exception, Error):
        exception.set (**kwargs)
        result = exception
    else:
        result = Error (**kwargs)
    
    if commandArgs.dextex:
        print ('''
    Exception of class {0} enhanced at:
        file: {1}
        function: {3}
        line: {2}
        context: {4}
        kwargs: {5}
        result: {6}
    '''.format (exception.__class__, *inspect.stack () [1][1:-1], kwargs, result))

    raise result from None
        
</t>
<t tx="ekr.20201219054931.136">def digestJavascript (code, symbols, mayStripComments, mayRemoveAnnotations,
    refuseIfAppearsMinified = False,
):
    '''
    - Honor ifdefs
    - Strip comments if allowed by commend line switch AND indicated by pragma
    - Harvest import and export info
    '''

    if refuseIfAppearsMinified and code [0] != '/':
        return None
    
    stripComments = False
        
    def stripSingleLineComments (line):
        pos = line.find ('//')
        return (line if pos &lt; 0 else line [ : pos]) .rstrip ()

    passStack = []

    def passable (targetLine):        
        # Has to count, since comments may be inside ifdefs
        
        nonlocal stripComments
        
        def __pragma__ (name, *args):

            nonlocal stripComments
        
            if name == 'stripcomments':
                stripComments = mayStripComments
            if name == 'ifdef':
                passStack.append (args [0] in symbols)
            elif name == 'ifndef':
                passStack.append (not args [0] in symbols)
            elif name == 'else':
                passStack [-1] = not passStack [-1]
            elif name == 'endif':
                passStack.pop ()

        strippedLine = targetLine.lstrip ()
        if stripComments and strippedLine.startswith ('/*'):
            passStack.append (False)
            return all (passStack)  # So skip this line
        elif stripComments and strippedLine.endswith ('*/'):
            passStack.pop ()        # Possibly pass next line
        elif strippedLine.startswith ('__pragma__') and (
            'stripcomments' in strippedLine or
            'ifdef' in strippedLine or
            'ifndef' in strippedLine or
            'else' in strippedLine or
            'endif' in strippedLine
        ):
            exec (strippedLine)
            return False            # Skip line anyhow, independent of passStack
        else:
            return all (passStack)  # Skip line only if not in passing state according to passStack
    
    passableLines = [line for line in code.split ('\n') if passable (line)]
    
    if stripComments:
        passableLines = [commentlessLine for commentlessLine in [stripSingleLineComments (line) for line in passableLines] if commentlessLine]
        
    result = Any (
        digestedCode = '\n'.join (passableLines),
        nrOfLines = len (passableLines),
        exportedNames = [],
        importedModuleNames = []
    )
    
    namesPattern = re.compile ('({.*})')
    pathPattern = re.compile ('([\'|\"].*[\'|\"])')
    wordPattern = re.compile (r'[\w$]+')
    for line in passableLines:
        words = wordPattern.findall (line)
        
        if words:
            if mayRemoveAnnotations and words [0] == '/*':  # If line starts with an annotation
                words = words [3 : ]                        # Remove the annotation before looking for export / import keywords
                
            if words [0] == 'export':
                # Deducing exported names from JavaScript is needed to facilitate * import by other modules
                
                if words [1] in {'var', 'function'}:
                    # Export prefix:    "export var ... or export function ..."
                    
                    result.exportedNames.append (words [2])
                else:
                    # Transit export:   "export {p, q, r, s};"  
                    
                    # Find exported names as "{p, q, r, s}"
                    match = namesPattern.search (line)
                    
                    # Substitute to become "{'p', 'q', 'r', 's'}" and use that set to extend the exported names list
                    if match:
                        result.exportedNames.extend (eval (wordPattern.sub (lambda nameMatch: f'\'{nameMatch.group ()}\'', match.group (1))))
                     
            if words [0] == 'import':
                # Deducing imported modules from JavaScript is needed to provide the right modules to JavaScript-only modules
                # They may have an explicit import list for unqualified access or an import * for qualified access
                # In both cases only the path of the imported module is needed, to be able to provide that module
                # It can be a path without extension, allowing both .py and .js files as imported modules
                #
                # - Unqualified import:   "import {p, q as Q, r, s as S} from '&lt;relative module path&gt;'"
                # - Qualified import:     "import * from '&lt;relative module path&gt;'"  
                
                match = pathPattern.search (line)
                if match:
                    result.importedModuleNames.append (eval (match.group (1)) [2:-3])
                
    return result
</t>
<t tx="ekr.20201219054931.137">@path transcrypt/modules/org/transcrypt/
__pragma__ ('stripcomments')

@others
@language javascript
@tabwidth -4
</t>
<t tx="ekr.20201219054931.138">__pragma__ ('ifdef', '__sform__')

Number.prototype.__format__ = function (fmt_spec) {
    if (fmt_spec == undefined || fmt_spec.strip ().length == 0) {
        return this.toString ();
    }
    var thousand_sep = false;
    var g_default = false;
    var width = 0;
    var zero = false;
    var alternate = false;
    var sign = '-';
    var align = '&gt;';
    var fill = ' ';
    var precision = undefined;
    var ftype = undefined;
    var val = this.valueOf ();
    var is_negative = val &lt; 0;
    val = Math.abs (val);
    
    @others // function pad and format_float.
    
    if (fmt_spec.endswith (['b', 'c', 'd', 'e', 'E', 'f', 'F', 'g', 'G', 'n', 'o', 'x', 'X', '%'])) {
        ftype = fmt_spec [fmt_spec.length - 1];
        fmt_spec = fmt_spec.slice (0, -1);
        if (ftype == 'n') {
            ftype = Number.isInteger (val) ? 'd' : 'f';
        }
    }
    else {
        ftype = Number.isInteger (val) ? 'd' : 'g';
        g_default = true;
    }
    
    var parts = fmt_spec.split ('.');
    fmt_spec = parts [0];
    precision = parts [1];
    if (precision != undefined) {
        precision = parseInt (precision);
    }
    if (fmt_spec.length &gt; 0 &amp;&amp; fmt_spec [fmt_spec.length - 1] == ',') {
        thousand_sep = true;
        fmt_spec = fmt_spec.slice (0, -1);
    }
    if (fmt_spec.length &gt; 0) {
        var _width = '';
        while (fmt_spec &amp;&amp; fmt_spec [fmt_spec.length - 1].isnumeric ()) {
            _width = fmt_spec [fmt_spec.length - 1] + _width;
            fmt_spec = fmt_spec.slice (0, -1);
        }
        if (_width.length &gt; 0) {
            if (_width [0] == '0') {
                width = parseInt (_width.substr (1));
                zero = true;
            }
            else {
                width = parseInt (_width);
            }
        }
        if (fmt_spec.length &gt; 0 &amp;&amp; fmt_spec [fmt_spec.length - 1] == '#') {
            alternate = true;
            fmt_spec = fmt_spec.slice (0, -1);
        }
        if (fmt_spec.length &gt; 0 &amp;&amp; fmt_spec.endswith (['+', '-', ' '])) {
            sign = fmt_spec [fmt_spec.length - 1];
            fmt_spec = fmt_spec.slice (0, -1);
        }
        if (fmt_spec.length &gt; 0 &amp;&amp; fmt_spec.endswith (['&lt;', '&gt;', '=', '^'])) {
            align = fmt_spec [fmt_spec.length - 1];
            fmt_spec = fmt_spec.slice (0, -1);
        }
        if (fmt_spec.length &gt; 0) {
            fill = fmt_spec [0];
        }
    }
    
    if (isNaN (val)) {
        val = 'nan';
    }
    else if (val == Infinity) {
        val = 'inf';
    }
    else {
        switch (ftype) {
            case 'b':
                val = Math.floor (val).toString (2);
                if (alternate) {
                    val = '0b' + val;
                }
                break;
            case 'c':
                val = String.fromCharCode (Math.floor (val));
                break;
            case 'd':
                val = Math.floor (val).toString ();
                if (thousand_sep) {
                    val = val.replace (/\B(?=(\d{3})+(?!\d))/g, ',');
                }
                break;
            case 'o':
                val = Math.floor (val).toString (8);
                if (alternate) {
                    val = '0o' + val;
                }
                break;
            case 'x':
            case 'X':
                val = Math.floor (val).toString (16);
                if (alternate) {
                    val = '0x' + val;
                }
                break;
            case 'e':
            case 'E':
                if (precision == undefined) {
                    precision = 6;
                }
                var num_exp = val.toExponential (precision).split ('e+');
                var num = num_exp [0];
                var exp = num_exp [1];
                val = num.toString () + 'e+' + pad (exp.toString(), 2, '0');
                val = format_float (val);
                break;
            case 'f':
            case 'F':
            case '%':
                if (precision == undefined) {
                    precision = 6;
                }
                if (ftype == '%') {
                    val *= 100;
                }
                val = val.toFixed (precision);
                val = format_float (val);
                if (ftype == '%') {
                    val += '%';
                }
                break;
            case 'g':
            case 'G':
                if (precision == undefined) {
                    precision = g_default ? 1 : 6;
                }
                if (precision == 0) {
                    precision = 1;
                }
                var convert_to_exponent = false;
                if (g_default) {
                    var parts = val.toString ().split ('.');
                    var digit_count = parts [0].length + parts [1].length;
                    if (digit_count &gt;= precision) {
                        convert_to_exponent = true;
                    }
                }
                var num_exp = val.toExponential (precision - 1).split ('e+');
                var num = num_exp [0];
                var exp = num_exp [1];
                convert_to_exponent |= !((-4 &lt;= exp &amp;&amp; exp &lt; precision));
                if (convert_to_exponent) {
                    val = num.toString() + 'e+' + pad (exp.toString(), 2, '0');
                }
                else {
                    val = val.toFixed (precision - 1 - exp);
                }
                val = format_float (val);
                break;
            default:
                throw ValueError ("Invalid format type: '" + ftype + "'", new Error ());
        }
    }
    if (ftype === ftype.toUpperCase ()) {
        val = val.toUpperCase ()
    }
    if (ftype != 'c') {
        if (sign == '-') {
            if (is_negative) {
                val = '-' + val;
            }
        }
        else {
            val = is_negative ? '-' + val : sign + val;
        }
    }
    if (zero) {
        fill = '0';
        align = '=';
    }
    if (width &gt; 0) {
        val = pad (val, width, fill, align);
    }
    return val;
};

__pragma__ ('endif')
   </t>
<t tx="ekr.20201219054931.139">function pad (s, width, fill, align) {
    if (fill == undefined) {
        fill = ' ';
    }
    if (align == undefined) {
        align = '&gt;';
    }
    var alt = '';
    var sign = '';
    if (s.startswith (['+', '-'])) {
        sign = s [0];
        s = s.substr (1);
    }
    if (alternate &amp;&amp; s.startswith (['0b', '0o', '0x'])) {
        alt = s.slice (0, 2);
        s = s.substr (2);
    }
    var len = s.length + sign.length + alt.length;
    var c = width - len;
    switch (align) {
        case '=':
            return sign + alt + __mul__ (fill, c) + s;
        case '&gt;':
            return __mul__ (fill, c) + sign + alt + s;
        case '&lt;':
            return sign + alt + s + __mul__ (fill, c);
        case '^':
            var m = ((c % 2) + 2) % 2;
            var c = Math.floor (c / 2);
            return __mul__ (fill, c) + sign + alt + s + __mul__ (fill, c + m);
        default:
            throw ValueError ("Invalid align type: '" + align + "'", new Error ());
    }
};

</t>
<t tx="ekr.20201219054931.14">def dumpTree (self):
    utils.log (False, 'Dumping syntax tree for module: {}\n', self.sourcePath)

    def walk (name, value, tabLevel):
        self.treeFragments .append ('\n{0}{1}: {2} '.format (tabLevel * '\t', name, type (value).__name__ ))
        if isinstance (value, ast.AST):
            for field in ast.iter_fields (value):
                walk (field [0], field [1], tabLevel + 1)
        elif isinstance (value, list):
            for element in value:
                walk ('element', element, tabLevel + 1)
        else:
            self.treeFragments.append ('= {0}'.format (value))

    self.treeFragments = []
    walk ('file', self.parseTree, 0)
    self.textTree = ''.join (self.treeFragments) [1:]

    with utils.create (self.treePath) as treeFile:
        treeFile.write (self.textTree)

</t>
<t tx="ekr.20201219054931.140">function format_float (val) {
    if (val.indexOf ('e+') == -1 &amp;&amp; (ftype == 'g' || ftype == 'G')) {
        var parts = val.py_split ('.');
        var d = parts [0];
        var t = parts [1];
        while (t [t.length - 1] == '0') {
            t = t.slice (0, -1);
        }
        val = t != '' ? '.'.join ([d, t]) : d;
    }
    if (alternate &amp;&amp; val.indexOf ('.') == -1) {
        val = val + '.';
    }
    return val;
};
       
</t>
<t tx="ekr.20201219054931.141">__PyIterator__.prototype.__next__ = function() {
    if (this.index &lt; this.iterable.length) {
        return this.iterable [this.index++];
    }
    else {
        throw StopIteration (new Error ());
    }
};

export function __JsIterator__ (iterable) {
    this.iterable = iterable;
    this.index = 0;
}

</t>
<t tx="ekr.20201219054931.142">__JsIterator__.prototype.next = function () {
    if (this.index &lt; this.iterable.py_keys.length) {
        return {value: this.index++, done: false};
    }
    else {
        return {value: undefined, done: true};
    }
};

</t>
<t tx="ekr.20201219054931.145">Array.prototype.__getslice__ = function (start, stop, step) {
    if (start &lt; 0) {
        start = this.length + start;
    }

    if (stop == null) {
        stop = this.length;
    }
    else if (stop &lt; 0) {
        stop = this.length + stop;
    }
    else if (stop &gt; this.length) {
        stop = this.length;
    }

    if (step == 1) {
        return Array.prototype.slice.call(this, start, stop);
    }

    let result = list ([]);
    for (let index = start; index &lt; stop; index += step) {
        result.push (this [index]);
    }

    return result;
};

</t>
<t tx="ekr.20201219054931.146">Array.prototype.__setslice__ = function (start, stop, step, source) {
    if (start &lt; 0) {
        start = this.length + start;
    }

    if (stop == null) {
        stop = this.length;
    }
    else if (stop &lt; 0) {
        stop = this.length + stop;
    }

    if (step == null) { // Assign to 'ordinary' slice, replace subsequence
        Array.prototype.splice.apply (this, [start, stop - start] .concat (source));
    }
    else {              // Assign to extended slice, replace designated items one by one
        let sourceIndex = 0;
        for (let targetIndex = start; targetIndex &lt; stop; targetIndex += step) {
            this [targetIndex] = source [sourceIndex++];
        }
    }
};

</t>
<t tx="ekr.20201219054931.147">Array.prototype.__repr__ = function () {
    if (this.__class__ == set &amp;&amp; !this.length) {
        return 'set()';
    }

    let result = !this.__class__ || this.__class__ == list ? '[' : this.__class__ == tuple ? '(' : '{';

    for (let index = 0; index &lt; this.length; index++) {
        if (index) {
            result += ', ';
        }
        result += repr (this [index]);
    }

    if (this.__class__ == tuple &amp;&amp; this.length == 1) {
        result += ',';
    }

    result += !this.__class__ || this.__class__ == list ? ']' : this.__class__ == tuple ? ')' : '}';;
    return result;
};

Array.prototype.__str__ = Array.prototype.__repr__;

</t>
<t tx="ekr.20201219054931.148">Array.prototype.append = function (element) {
    this.push (element);
};

</t>
<t tx="ekr.20201219054931.149">Array.prototype.py_clear = function () {
    this.length = 0;
};

</t>
<t tx="ekr.20201219054931.15">class Generator (ast.NodeVisitor):
    # Terms like parent, child, ancestor and descendant refer to the parse tree here, not to inheritance

    @others
</t>
<t tx="ekr.20201219054931.150">Array.prototype.extend = function (aList) {
    this.push.apply (this, aList);
};

</t>
<t tx="ekr.20201219054931.151">Array.prototype.insert = function (index, element) {
    this.splice (index, 0, element);
};

</t>
<t tx="ekr.20201219054931.152">Array.prototype.remove = function (element) {
    let index = this.indexOf (element);
    if (index == -1) {
        throw ValueError ("list.remove(x): x not in list", new Error ());
    }
    this.splice (index, 1);
};

</t>
<t tx="ekr.20201219054931.153">Array.prototype.index = function (element) {
    return this.indexOf (element);
};

</t>
<t tx="ekr.20201219054931.154">Array.prototype.py_pop = function (index) {
    if (index == undefined) {
        return this.pop ();  // Remove last element
    }
    else {
        return this.splice (index, 1) [0];
    }
};

</t>
<t tx="ekr.20201219054931.155">Array.prototype.py_sort = function () {
    __sort__.apply  (null, [this].concat ([] .slice.apply (arguments)));    // Can't work directly with arguments
    // Python params: (iterable, key = None, reverse = False)
    // py_sort is called with the Transcrypt kwargs mechanism, and just passes the params on to __sort__
    // __sort__ is def'ed with the Transcrypt kwargs mechanism
};

</t>
<t tx="ekr.20201219054931.156">Array.prototype.__add__ = function (aList) {
    return list (this.concat (aList));
};

</t>
<t tx="ekr.20201219054931.157">Array.prototype.__mul__ = function (scalar) {
    let result = this;
    for (let i = 1; i &lt; scalar; i++) {
        result = result.concat (this);
    }
    return result;
};

Array.prototype.__rmul__ = Array.prototype.__mul__;

// Tuple extensions to Array

export function tuple (iterable) {
    let instance = iterable ? [] .slice.apply (iterable) : [];
    instance.__class__ = tuple; // Not all arrays are tuples
    return instance;
}
tuple.__name__ = 'tuple';
tuple.__bases__ = [object];

// Set extensions to Array
// N.B. Since sets are unordered, set operations will occasionally alter the 'this' array by sorting it

export function set (iterable) {
    let instance = [];
    if (iterable) {
        for (let index = 0; index &lt; iterable.length; index++) {
            instance.add (iterable [index]);
        }
    }
    instance.__class__ = set;   // Not all arrays are sets
    return instance;
}
set.__name__ = 'set';
set.__bases__ = [object];

</t>
<t tx="ekr.20201219054931.158">Array.prototype.__bindexOf__ = function (element) { // Used to turn O (n^2) into O (n log n)
// Since sorting is lex, compare has to be lex. This also allows for mixed lists

    element += '';

    let mindex = 0;
    let maxdex = this.length - 1;

    while (mindex &lt;= maxdex) {
        let index = (mindex + maxdex) / 2 | 0;
        let middle = this [index] + '';

        if (middle &lt; element) {
            mindex = index + 1;
        }
        else if (middle &gt; element) {
            maxdex = index - 1;
        }
        else {
            return index;
        }
    }

    return -1;
};

</t>
<t tx="ekr.20201219054931.159">Array.prototype.add = function (element) {
    if (this.indexOf (element) == -1) { // Avoid duplicates in set
        this.push (element);
    }
};

</t>
<t tx="ekr.20201219054931.16">def __init__ (self, module):
    self.module = module

    self.targetFragments = []
    self.fragmentIndex = 0
    self.indentLevel = 0
    self.scopes = []
    self.importHeads = set ()
    self.importHoistMemos = []
    self.allOwnNames = set ()
    self.allImportedNames = set ()
    self.expectingNonOverloadedLhsIndex = False
    self.lineNr = 1
    self.propertyAccessorList = []
    self.mergeList = []

    self.aliases = [
    # START predef_aliases

        # Format: ('&lt;Python source identifier&gt;', '&lt;JavaScript target identifier&gt;')

                                                ('js_and', 'and'),
        ('arguments', 'py_arguments'),          ('js_arguments', 'arguments'),
        ('case', 'py_case'),
        ('clear', 'py_clear'),                  ('js_clear', 'clear'),
                                                ('js_conjugate', 'conjugate'),
        ('default', 'py_default'),
        ('del', 'py_del'),                      ('js_del', 'del'),
        ('false', 'py_false'),
                                                ('js_from', 'from'),
        ('get', 'py_get'),                      ('js_get', 'get'),
                                                ('js_global', 'global'),
        ('Infinity', 'py_Infinity'),            ('js_Infinity', 'Infinity'),
        ('is', 'py_is'),                        ('js_is', 'is'),
        ('isNaN', 'py_isNaN'),                  ('js_isNaN', 'isNaN'),
        ('iter', 'py_iter'),                    ('js_iter', 'iter'),
        ('items', 'py_items'),                  ('js_items', 'items'),
        ('keys', 'py_keys'),                    ('js_keys', 'keys'),
        ('name', 'py_name'),                    ('js_name', 'name'),
        ('NaN', 'py_NaN'),                      ('js_NaN', 'NaN'),
        ('new', 'py_new'),
        ('next', 'py_next'),                    ('js_next', 'next'),
                                                ('js_not', 'not'),
                                                ('js_or', 'or'),
        ('pop', 'py_pop'),                      ('js_pop', 'pop'),
        ('popitem', 'py_popitem'),              ('js_popitem', 'popitem'),
        ('replace', 'py_replace'),              ('js_replace', 'replace'),
        ('selector', 'py_selector'),            ('js_selector', 'selector'),
        ('sort', 'py_sort'),                    ('js_sort', 'sort'),
        ('split', 'py_split'),                  ('js_split', 'split'),
        ('switch', 'py_switch'),
        ('type', 'py_metatype'),                ('js_type', 'type'),    # Only for the type metaclass, the type operator is dealt with separately in visit_Call
        ('TypeError', 'py_TypeError'),          ('js_TypeError', 'TypeError'),
        ('update', 'py_update'),                ('js_update', 'update'),
        ('values', 'py_values'),                ('js_values', 'values'),
        ('reversed', 'py_reversed'),            ('js_reversed', 'reversed'),
        ('setdefault', 'py_setdefault'),        ('js_setdefault', 'setdefault'),
                                                ('js_super', 'super'),
        ('true', 'py_true'),
        ('undefined', 'py_undefined'),          ('js_undefined', 'undefined'),

    # END predef_aliases
    ]

    self.idFiltering = True

    self.tempIndices = {}
    self.skippedTemps = set ()
    self.stubsName = 'org.{}.stubs.'.format (self.module.program.envir.transpiler_name)

    self.nameConsts = {
        None: 'null',
        True: 'true',
        False: 'false'
    }

    '''
    The precendences explicitly given as integers in the list below are JavaScript precedences as specified by:
    https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence .

    Python precedences are implicitly present in branch ordering of the AST generated by CPython's parser.
    '''

    self.operators = {
        # Highest precendence

        ast.Not: ('!', 16),
        ast.Invert: ('~', 16),
        ast.UAdd: ('+', 16),
        ast.USub: ('-', 16),

        ast.Pow: (None, 15),        # Dealt with separately

        ast.Mult: ('*', 14),
        ast.MatMult: (None, 14),    # Dealt with separately
        ast.Div: ('/', 14),
        ast.FloorDiv: (None, 14),   # Dealt with separately
        ast.Mod: ('%', 14),         # Used only for JavaScript %, which differs from Python %

        ast.Add: ('+', 13),
        ast.Sub: ('-', 13),

        ast.LShift: ('&lt;&lt;', 12),
        ast.RShift: ('&gt;&gt;', 12),

        ast.Lt: ('&lt;', 11),
        ast.LtE: ('&lt;=', 11),
        ast.Gt: ('&gt;', 11),
        ast.GtE: ('&gt;=', 11),
        ast.In: (None, 11),         # Dealt with separately
        ast.NotIn: (None, 11),      # Dealt with separately

        ast.Eq: ('==', 10),
        ast.NotEq: ('!=', 10),
        ast.Is: ('===', 10),        # Not really, but closest for now
        ast.IsNot: ('!==', 10),     # Not really, but closest for now

        ast.BitAnd: ('&amp;', 9),
        ast.BitOr: ('|', 8),
        ast.BitXor: ('^', 7),
        ast.And: ('&amp;&amp;', 6),
        ast.Or: ('||', 5)

        # Lowest precedence
    }

    self.allowKeywordArgs = utils.commandArgs.kwargs
    self.allowOperatorOverloading = utils.commandArgs.opov
    self.allowConversionToIterable = utils.commandArgs.iconv
    self.allowConversionToTruthValue = utils.commandArgs.tconv
    self.allowKeyCheck = utils.commandArgs.keycheck
    self.allowDebugMap = utils.commandArgs.anno and not self.module.sourcePath.endswith ('.js')
    self.allowDocAttribs = utils.commandArgs.docat
    self.allowGlobals = utils.commandArgs.xglobs
    self.allowJavaScriptIter = False
    self.allowJavaScriptCall = utils.commandArgs.jscall
    self.allowJavaScriptKeys = utils.commandArgs.jskeys
    self.allowJavaScriptMod = utils.commandArgs.jsmod
    self.allowMemoizeCalls = utils.commandArgs.fcall

    self.noskipCodeGeneration = True
    self.conditionalCodeGeneration = True
    self.stripTuple = False     # For speed, tuples are translated to bare JavaScript arrays if they're just indices. Will autoreset.
    self.stripTuples = False    # For correctness, tuples are translated to bare JavaScript arrays if they are assignment target in a JavaScript 6 for-loop. Will not autoreset.
    self.replaceSend = False

    try:
        self.visit (module.parseTree)
        self.targetFragments.append (self.lineNrString) # Last target fragment doesn't have a '\n' to replace in the emit method

    except Exception as exception:
        utils.enhanceException (
            exception,
            lineNr = self.lineNr
        )

    if self.tempIndices:
        raise utils.Error (
            message = '\n\tTemporary variables leak in code generator: {}'.format (self.tempIndices)
        )

</t>
<t tx="ekr.20201219054931.160">Array.prototype.discard = function (element) {
    var index = this.indexOf (element);
    if (index != -1) {
        this.splice (index, 1);
    }
};

</t>
<t tx="ekr.20201219054931.161">Array.prototype.isdisjoint = function (other) {
    this.sort ();
    for (let i = 0; i &lt; other.length; i++) {
        if (this.__bindexOf__ (other [i]) != -1) {
            return false;
        }
    }
    return true;
};

</t>
<t tx="ekr.20201219054931.162">Array.prototype.issuperset = function (other) {
    this.sort ();
    for (let i = 0; i &lt; other.length; i++) {
        if (this.__bindexOf__ (other [i]) == -1) {
            return false;
        }
    }
    return true;
};

</t>
<t tx="ekr.20201219054931.163">Array.prototype.issubset = function (other) {
    return set (other.slice ()) .issuperset (this); // Sort copy of 'other', not 'other' itself, since it may be an ordered sequence
};

</t>
<t tx="ekr.20201219054931.164">Array.prototype.union = function (other) {
    let result = set (this.slice () .sort ());
    for (let i = 0; i &lt; other.length; i++) {
        if (result.__bindexOf__ (other [i]) == -1) {
            result.push (other [i]);
        }
    }
    return result;
};

</t>
<t tx="ekr.20201219054931.165">Array.prototype.intersection = function (other) {
    this.sort ();
    let result = set ();
    for (let i = 0; i &lt; other.length; i++) {
        if (this.__bindexOf__ (other [i]) != -1) {
            result.push (other [i]);
        }
    }
    return result;
};

</t>
<t tx="ekr.20201219054931.166">Array.prototype.difference = function (other) {
    let sother = set (other.slice () .sort ());
    let result = set ();
    for (let i = 0; i &lt; this.length; i++) {
        if (sother.__bindexOf__ (this [i]) == -1) {
            result.push (this [i]);
        }
    }
    return result;
};

</t>
<t tx="ekr.20201219054931.167">Array.prototype.symmetric_difference = function (other) {
    return this.union (other) .difference (this.intersection (other));
};

</t>
<t tx="ekr.20201219054931.168">Array.prototype.py_update = function () {   // O (n)
    let updated = [] .concat.apply (this.slice (), arguments) .sort ();
    this.py_clear ();
    for (let i = 0; i &lt; updated.length; i++) {
        if (updated [i] != updated [i - 1]) {
            this.push (updated [i]);
        }
    }
};

</t>
<t tx="ekr.20201219054931.169">Array.prototype.__eq__ = function (other) { // Also used for list
    if (this.length != other.length) {
        return false;
    }
    if (this.__class__ == set) {
        this.sort ();
        other.sort ();
    }
    for (let i = 0; i &lt; this.length; i++) {
        if (this [i] != other [i]) {
            return false;
        }
    }
    return true;
};

</t>
<t tx="ekr.20201219054931.17">def visitSubExpr (self, node, child):

    def getPriority (exprNode):
        if type (exprNode) in (ast.BinOp, ast.BoolOp):
            return self.operators [type (exprNode.op)][1]
        elif type (exprNode) == ast.Compare:
            return self.operators [type (exprNode.ops [0])][1]  # All ops have same priority
        elif type (exprNode) == ast.Yield:
            return -1000000
        else:
            return 1000000  # No need for parenthesis

    if getPriority (child) &lt;= getPriority (node):
        self.emit ('(')
        self.visit (child)
        self.emit (')')
    else:
        self.visit (child)

</t>
<t tx="ekr.20201219054931.170">Array.prototype.__ne__ = function (other) { // Also used for list
    return !this.__eq__ (other);
};

</t>
<t tx="ekr.20201219054931.171">Array.prototype.__le__ = function (other) {
    if (this.__class__ == set) {
        return this.issubset (other);
    }
    else {
        for (let i = 0; i &lt; this.length; i++) {
            if (this [i] &gt; other [i]) {
                return false;
            }
            else if (this [i] &lt; other [i]) {
                return true;
            }
        }
        return true;
    }
};

</t>
<t tx="ekr.20201219054931.172">Array.prototype.__ge__ = function (other) {
    if (this.__class__ == set) {
        return this.issuperset (other);
    }
    else {
        for (let i = 0; i &lt; this.length; i++) {
            if (this [i] &lt; other [i]) {
                return false;
            }
            else if (this [i] &gt; other [i]) {
                return true;
            }
        }
        return true;
    }
};

</t>
<t tx="ekr.20201219054931.173">Array.prototype.__lt__ = function (other) {
    return (
        this.__class__ == set ?
        this.issubset (other) &amp;&amp; !this.issuperset (other) :
        !this.__ge__ (other)
    );
};

</t>
<t tx="ekr.20201219054931.174">Array.prototype.__gt__ = function (other) {
    return (
        this.__class__ == set ?
        this.issuperset (other) &amp;&amp; !this.issubset (other) :
        !this.__le__ (other)
    );
};

</t>
<t tx="ekr.20201219054931.175">Uint8Array.prototype.__add__ = function (aBytes) {
    let result = new Uint8Array (this.length + aBytes.length);
    result.set (this);
    result.set (aBytes, this.length);
    return result;
};

</t>
<t tx="ekr.20201219054931.176">Uint8Array.prototype.__mul__ = function (scalar) {
    let result = new Uint8Array (scalar * this.length);
    for (let i = 0; i &lt; scalar; i++) {
        result.set (this, i * this.length);
    }
    return result;
};

Uint8Array.prototype.__rmul__ = Uint8Array.prototype.__mul__;

</t>
<t tx="ekr.20201219054931.177">String.prototype.__repr__ = function () {
    return (this.indexOf ('\'') == -1 ? '\'' + this + '\'' : '"' + this + '"') .py_replace ('\t', '\\t') .py_replace ('\n', '\\n');
};

</t>
<t tx="ekr.20201219054931.178">String.prototype.__str__ = function () {
    return this;
};

</t>
<t tx="ekr.20201219054931.179">String.prototype.capitalize = function () {
    return this.charAt (0).toUpperCase () + this.slice (1);
};

</t>
<t tx="ekr.20201219054931.18">def filterId (self, qualifiedId):   # Convention: only called at emission time or file name fabrication time

    if not self.idFiltering or (qualifiedId.startswith ('__') and qualifiedId.endswith ('__')):
        # Leave system dunder names unchanged
        return qualifiedId
    else:
        # Filter the rest, trying all aliases sucessively
        for alias in self.aliases:

            # Replace non-adjacent and odd adjacent matches, turning __&lt;alias [0]&gt;__ into =&lt;alias [1]&gt;=
            qualifiedId = re.sub (
                fr'(^|(?P&lt;preDunder&gt;__)|(?&lt;=[./])){alias [0]}((?P&lt;postDunder&gt;__)|(?=[./])|$)',
                lambda matchObject: (
                    ('=' if matchObject.group ('preDunder') else '') +
                    alias [1] +
                    ('=' if matchObject.group ('postDunder') else '')
                ),
                qualifiedId
            )

            # Replace all remaining matches
            qualifiedId = re.sub (
                fr'(^|(?&lt;=[./=])){alias [0]}((?=[./=])|$)',
                alias [1],
                qualifiedId
            )

        # Take out all occurences of temporary =, leave non-matching __ unchanged)
        return qualifiedId.replace ('=', '')

</t>
<t tx="ekr.20201219054931.180">String.prototype.endswith = function (suffix) {
    if (suffix instanceof Array) {
        for (var i=0;i&lt;suffix.length;i++) {
            if (this.slice (-suffix[i].length) == suffix[i])
                return true;
        }
    } else
        return suffix == '' || this.slice (-suffix.length) == suffix;
    return false;
};

</t>
<t tx="ekr.20201219054931.181">String.prototype.find = function (sub, start) {
    return this.indexOf (sub, start);
};

</t>
<t tx="ekr.20201219054931.182">String.prototype.__getslice__ = function (start, stop, step) {
    if (start &lt; 0) {
        start = this.length + start;
    }

    if (stop == null) {
        stop = this.length;
    }
    else if (stop &lt; 0) {
        stop = this.length + stop;
    }

    var result = '';
    if (step == 1) {
        result = this.substring (start, stop);
    }
    else {
        for (var index = start; index &lt; stop; index += step) {
            result = result.concat (this.charAt(index));
        }
    }
    return result;
};

</t>
<t tx="ekr.20201219054931.183">__pragma__ ('ifdef', '__sform__')

String.prototype.__format__ = function (fmt_spec) {
    if (fmt_spec == undefined || fmt_spec.strip ().length == 0) {
        return this.valueOf ();
    }
    var width = 0;
    var align = '&lt;';
    var fill = ' ';
    var val = this.valueOf ();
    
    function pad (s, width, fill, align) {
        var len = s.length;
        var c = width - len;
        switch (align) {
            case '&gt;':
                return __mul__ (fill, c) + s;
            case '&lt;':
                return s + __mul__ (fill, c);
            case '^':
                var m = ((c % 2) + 2) % 2;
                var c = Math.floor (c / 2);
                return __mul__ (fill, c) + s + __mul__ (fill, c + m);
            default:
                return s;
        }
    };

    if (fmt_spec [fmt_spec.length - 1] == 's') {
        fmt_spec = fmt_spec.slice (0, -1);
    }
    if (fmt_spec.length &gt; 0) {
        var _width = '';
        while (fmt_spec &amp;&amp; fmt_spec [fmt_spec.length - 1].isnumeric ()) {
            _width = fmt_spec [fmt_spec.length - 1] + _width;
            fmt_spec = fmt_spec.slice (0, -1);
        }
        if (_width.length &gt; 0) {
            width = parseInt (_width);
        }
        if (fmt_spec.length &gt; 0 &amp;&amp; fmt_spec.endswith (['&lt;', '&gt;', '^'])) {
            align = fmt_spec [fmt_spec.length - 1];
            fmt_spec = fmt_spec.slice (0, -1);
        }
        if (fmt_spec.length &gt; 0) {
            fill = fmt_spec [0];
        }
    }
    if (width &gt; 0) {
        val = pad (val, width, fill, align);
    }
    return val;
};

__pragma__ ('endif')

</t>
<t tx="ekr.20201219054931.187">String.prototype.isalnum = function () {
    return /^[0-9a-zA-Z]{1,}$/.test(this)
}

</t>
<t tx="ekr.20201219054931.188">String.prototype.isalpha = function () {
    return /^[a-zA-Z]{1,}$/.test(this)
}

</t>
<t tx="ekr.20201219054931.189">String.prototype.isdecimal = function () {
    return /^[0-9]{1,}$/.test(this)
}

</t>
<t tx="ekr.20201219054931.19">def tabs (self, indentLevel = None):
    if indentLevel == None:
        indentLevel = self.indentLevel
    return indentLevel * '\t'

</t>
<t tx="ekr.20201219054931.190">String.prototype.isdigit = function () {
    return this.isdecimal()
}

</t>
<t tx="ekr.20201219054931.191">String.prototype.islower = function () {
    return /^[a-z]{1,}$/.test(this)
}

</t>
<t tx="ekr.20201219054931.192">String.prototype.isupper = function () {
    return /^[A-Z]{1,}$/.test(this)
}

</t>
<t tx="ekr.20201219054931.193">String.prototype.isspace = function () {
    return /^[\s]{1,}$/.test(this)
}

</t>
<t tx="ekr.20201219054931.194">String.prototype.isnumeric = function () {
    return !isNaN (parseFloat (this)) &amp;&amp; isFinite (this);
};

</t>
<t tx="ekr.20201219054931.195">String.prototype.join = function (strings) {
    strings = Array.from (strings); // Much faster than iterating through strings char by char
    return strings.join (this);
};

</t>
<t tx="ekr.20201219054931.196">String.prototype.lower = function () {
    return this.toLowerCase ();
};

</t>
<t tx="ekr.20201219054931.197">String.prototype.py_replace = function (old, aNew, maxreplace) {
    return this.split (old, maxreplace) .join (aNew);
};

</t>
<t tx="ekr.20201219054931.198">String.prototype.lstrip = function () {
    return this.replace (/^\s*/g, '');
};

</t>
<t tx="ekr.20201219054931.199">String.prototype.rfind = function (sub, start) {
    return this.lastIndexOf (sub, start);
};

</t>
<t tx="ekr.20201219054931.2">@path transcript/modules/org/transcrypt/
&lt;&lt; legal notices &gt;&gt;
&lt;&lt; imports &gt;&gt;
&lt;&lt; data &gt;&gt;
'''
All files required for deployment are placed in subdirectory __target__ of
the application. Each module has an unambiguous dotted path, always from
one of the module roots, never relative. Dotted paths are translated to
dotted filenames. The __runtime__ module is just another Python module with
lots of JS code inside __pragma__ ('js', '{}', include...) fragments,
namely the __core__ and __builtin__ parts.

Sourcemaps are generated per module. There's no need for a link with other
modules. Since import paths are static, names of minified JS files simply
end on .js just like non-minified files, so not on .min.js. Sourcemaps are
named &lt;module name&gt;.map.
'''
@others
@language python
@tabwidth -4
@ignore
</t>
<t tx="ekr.20201219054931.20">def emit (self, fragment, *formatter):
    if (                                                                                            # If at the start of a new line
        not self.targetFragments or                                                                 # It may be the first line
        (self.targetFragments and self.targetFragments [self.fragmentIndex - 1] .endswith ('\n'))   # It may a new line but not the first line
    ):
        self.targetFragments.insert (self.fragmentIndex, self.tabs ())
        self.fragmentIndex += 1

    fragment = fragment [:-1] .replace ('\n', '\n' + self.tabs ()) + fragment [-1]                  # There may be \n's embedded in the fragment

    self.targetFragments.insert (self.fragmentIndex, fragment.format (*formatter) .replace ('\n', self.lineNrString + '\n'))
    self.fragmentIndex += 1

</t>
<t tx="ekr.20201219054931.200">String.prototype.rsplit = function (sep, maxsplit) {
    // The combination of general whitespace sep and positive maxsplit
    // is neither supported nor checked, expensive and rare.
    if (sep == undefined || sep == null) {
        sep = /\s+/;
        var stripped = this.strip ();
    }
    else {
        var stripped = this;
    }

    if (maxsplit == undefined || maxsplit == -1) {
        return stripped.split (sep);
    }
    else {
        var result = stripped.split (sep);
        if (maxsplit &lt; result.length) {
            var maxrsplit = result.length - maxsplit;
            return [result.slice (0, maxrsplit) .join (sep)] .concat (result.slice (maxrsplit));
        }
        else {
            return result;
        }
    }
};

</t>
<t tx="ekr.20201219054931.201">String.prototype.rstrip = function () {
    return this.replace (/\s*$/g, '');
};

</t>
<t tx="ekr.20201219054931.202">String.prototype.py_split = function (sep, maxsplit) {
    // The combination of general whitespace sep and positive maxsplit
    // is neither supported nor checked, expensive and rare.
    if (sep == undefined || sep == null) {
        sep = /\s+/;
        var stripped = this.strip ();
    }
    else {
        var stripped = this;
    }

    if (maxsplit == undefined || maxsplit == -1) {
        return stripped.split (sep);
    }
    else {
        var result = stripped.split (sep);
        if (maxsplit &lt; result.length) {
            return result.slice (0, maxsplit).concat ([result.slice (maxsplit).join (sep)]);
        }
        else {
            return result;
        }
    }
};

</t>
<t tx="ekr.20201219054931.203">String.prototype.startswith = function (prefix) {
    if (prefix instanceof Array) {
        for (var i=0;i&lt;prefix.length;i++) {
            if (this.indexOf (prefix [i]) == 0)
                return true;
        }
    } else
        return this.indexOf (prefix) == 0;
    return false;
};

</t>
<t tx="ekr.20201219054931.204">String.prototype.strip = function () {
    return this.trim ();
};

</t>
<t tx="ekr.20201219054931.205">String.prototype.upper = function () {
    return this.toUpperCase ();
};

</t>
<t tx="ekr.20201219054931.206">String.prototype.__mul__ = function (scalar) {
    var result = '';
    for (var i = 0; i &lt; scalar; i++) {
        result = result + this;
    }
    return result;
};

String.prototype.__rmul__ = String.prototype.__mul__;

</t>
<t tx="ekr.20201219054931.207">function __contains__ (element) {
    return this.hasOwnProperty (element);
}

</t>
<t tx="ekr.20201219054931.208">function __keys__ () {
    var keys = [];
    for (var attrib in this) {
        if (!__specialattrib__ (attrib)) {
            keys.push (attrib);
        }
    }
    return keys;
}

</t>
<t tx="ekr.20201219054931.209">function __items__ () {
    var items = [];
    for (var attrib in this) {
        if (!__specialattrib__ (attrib)) {
            items.push ([attrib, this [attrib]]);
        }
    }
    return items;
}

</t>
<t tx="ekr.20201219054931.21">def indent (self):
    self.indentLevel += 1

</t>
<t tx="ekr.20201219054931.210">function __del__ (key) {
    delete this [key];
}

</t>
<t tx="ekr.20201219054931.211">function __clear__ () {
    for (var attrib in this) {
        delete this [attrib];
    }
}

</t>
<t tx="ekr.20201219054931.212">function __getdefault__ (aKey, aDefault) {
    // Each Python object already has a function called __get__,
    // so we call this one __getdefault__
    var result = this [aKey];
    if (result == undefined) {
        result = this ['py_' + aKey]
    }
    return result == undefined ? (aDefault == undefined ? null : aDefault) : result;
}

</t>
<t tx="ekr.20201219054931.213">function __setdefault__ (aKey, aDefault) {
    var result = this [aKey];
    if (result != undefined) {
        return result;
    }
    var val = aDefault == undefined ? null : aDefault;
    this [aKey] = val;
    return val;
}

</t>
<t tx="ekr.20201219054931.214">function __pop__ (aKey, aDefault) {
    var result = this [aKey];
    if (result != undefined) {
        delete this [aKey];
        return result;
    } else {
        // Identify check because user could pass None
        if ( aDefault === undefined ) {
            throw KeyError (aKey, new Error());
        }
    }
    return aDefault;
}

</t>
<t tx="ekr.20201219054931.215">function __popitem__ () {
    var aKey = Object.keys (this) [0];
    if (aKey == null) {
        throw KeyError ("popitem(): dictionary is empty", new Error ());
    }
    var result = tuple ([aKey, this [aKey]]);
    delete this [aKey];
    return result;
}

</t>
<t tx="ekr.20201219054931.216">function __update__ (aDict) {
    for (var aKey in aDict) {
        this [aKey] = aDict [aKey];
    }
}

</t>
<t tx="ekr.20201219054931.217">function __values__ () {
    var values = [];
    for (var attrib in this) {
        if (!__specialattrib__ (attrib)) {
            values.push (this [attrib]);
        }
    }
    return values;

}

</t>
<t tx="ekr.20201219054931.218">function __dgetitem__ (aKey) {
    return this [aKey];
}

</t>
<t tx="ekr.20201219054931.219">function __dsetitem__ (aKey, aValue) {
    this [aKey] = aValue;
}
</t>
<t tx="ekr.20201219054931.22">def dedent (self):
    self.indentLevel -= 1

</t>
<t tx="ekr.20201219054931.220">// Docstring setter
function __setdoc__ (docString) {
    this.__doc__ = docString;
    return this;
}

// Python classes, methods and functions are all translated to JavaScript functions
__setproperty__ (Function.prototype, '__setdoc__', {value: __setdoc__, enumerable: false});

</t>
<t tx="ekr.20201219054931.221">@path transcrypt/modules/org/transcrypt/
__pragma__ ('stripcomments')

&lt;&lt; overview &gt;&gt;
@others
@language javascript
@tabwidth -4
</t>
<t tx="ekr.20201219054931.223">@path transcrypt/modules/org/transcrypt/
__envir__.interpreter_name = 'python';
__envir__.transpiler_name = 'transcrypt';
__envir__.executor_name = __envir__.transpiler_name;
__envir__.transpiler_version = '3.7.16';
@language javascript
@tabwidth -4
</t>
<t tx="ekr.20201219054931.224">@path transcrypt/modules/org/transcrypt/

# Transcrypt runtime module

#__pragma__ ('js', 'export var __envir__ = {{}};\n{}', __include__ ('org/transcrypt/__envir__.js'))
#__pragma__ ('js', '{}', __include__ ('org/transcrypt/__core__.js'))
#__pragma__ ('js', '{}', __include__ ('org/transcrypt/__builtin__.js'))

#__pragma__ ('skip')

copy = Math = __typeof__ = __repr__ = document = console = window = 0

#__pragma__ ('noskip')

#__pragma__ ('notconv')  # !!! tconv gives a problem with __terminal__, needs investigation
#__pragma__ ('nokwargs')
#__pragma__ ('noalias', 'sort')

@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20201219054931.226">class BaseException:
    pass

</t>
<t tx="ekr.20201219054931.227">class Exception (BaseException):
    
    @others
</t>
<t tx="ekr.20201219054931.228">#__pragma__ ('kwargs')
def __init__ (self, *args, **kwargs):
    self.__args__ = args
    try:
        self.stack = kwargs.error.stack # Integrate with JavaScript Error object
    except:
        self.stack = 'No stack trace available'
#__pragma__ ('nokwargs')
    
</t>
<t tx="ekr.20201219054931.229">def __repr__ (self):
    if len (self.__args__) &gt; 1:
        return '{}{}'.format (self.__class__.__name__, repr (tuple (self.__args__)))
    elif len (self.__args__):
        return '{}({})'.format (self.__class__.__name__, repr (self.__args__ [0]))        
    else:
        return '{}()'.format (self.__class__.__name__)
        
</t>
<t tx="ekr.20201219054931.23">def inscope (self, node):
    # Called at visiting modules, classes and functions
    self.scopes.append (utils.Any (
        node = node,
        nonlocals = set (),
        containsYield = False
    ))

</t>
<t tx="ekr.20201219054931.230">def __str__ (self):
    if len (self.__args__) &gt; 1:
        return str (tuple (self.__args__))
    elif len (self.__args__):
        return str (self.__args__ [0])
    else:
        return ''
    
</t>
<t tx="ekr.20201219054931.231">class IterableError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.232">def __init__ (self, error):
    Exception.__init__ (self, 'Can\'t iterate over non-iterable', error = error)
        
</t>
<t tx="ekr.20201219054931.233">class StopIteration (Exception):
    @others
</t>
<t tx="ekr.20201219054931.234">def __init__ (self, error):
    Exception.__init__ (self, 'Iterator exhausted', error = error)
    
</t>
<t tx="ekr.20201219054931.235">class ValueError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.236">def __init__ (self, message, error):
    Exception.__init__ (self, message, error = error)

</t>
<t tx="ekr.20201219054931.237">class KeyError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.238">def __init__ (self, message, error):
    Exception.__init__ (self, message, error = error)

</t>
<t tx="ekr.20201219054931.239">class AssertionError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.24">def descope (self):
    self.scopes.pop ()

</t>
<t tx="ekr.20201219054931.240">def __init__ (self, message, error):
    if message:
        Exception.__init__ (self, message, error = error)
    else:
        Exception.__init__ (self, error = error)

</t>
<t tx="ekr.20201219054931.241">class NotImplementedError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.242">def __init__(self, message, error):
    Exception.__init__(self, message, error = error)

</t>
<t tx="ekr.20201219054931.243">class IndexError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.244">def __init__(self, message, error):
    Exception.__init__(self, message, error = error)

</t>
<t tx="ekr.20201219054931.245">class AttributeError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.246">def __init__(self, message, error):
    Exception.__init__(self, message, error = error)

</t>
<t tx="ekr.20201219054931.247">class TypeError (Exception):
    @others
</t>
<t tx="ekr.20201219054931.248">def __init__(self, message, error):
    Exception.__init__(self, message, error = error)

</t>
<t tx="ekr.20201219054931.249"># Warnings Exceptions
# N.B. This is a limited subset of the warnings defined in
# the cpython implementation to keep things small for now.
class Warning (Exception):
    ''' Warning Base Class
    '''
    pass

</t>
<t tx="ekr.20201219054931.25">def getScope (self, *nodeTypes):
    if nodeTypes:
        for scope in reversed (self.scopes):
            if type (scope.node) in nodeTypes:
                return scope
    else:
        return self.scopes [-1]

</t>
<t tx="ekr.20201219054931.250">class UserWarning (Warning):
    pass

</t>
<t tx="ekr.20201219054931.251">class DeprecationWarning (Warning):
    pass

</t>
<t tx="ekr.20201219054931.252">class RuntimeWarning (Warning):
    pass
    
#__pragma__ ('kwargs')

</t>
<t tx="ekr.20201219054931.253">def __sort__ (iterable, key = None, reverse = False):               # Used by py_sort, can deal with kwargs
    if key:
        iterable.sort (lambda a, b: 1 if key (a) &gt; key (b) else -1) # JavaScript sort, case '==' is irrelevant for sorting
    else:
        iterable.sort ()                                            # JavaScript sort
        
    if reverse:
        iterable.reverse ()
        
</t>
<t tx="ekr.20201219054931.254">def sorted (iterable, key = None, reverse = False):
    if type (iterable) == dict:
        result = copy (iterable.keys ()) 
    else:       
        result = copy (iterable)
        
    __sort__ (result, key, reverse)
    return result

#__pragma__ ('nokwargs')

</t>
<t tx="ekr.20201219054931.255">def map (func, iterable):
    return [func (item) for item in iterable]


</t>
<t tx="ekr.20201219054931.256">def filter (func, iterable):
    if func == None:
        func = bool
    return [item for item in iterable if func (item)]
    
</t>
<t tx="ekr.20201219054931.257">def divmod (n, d):
    return n // d, n % d
    
</t>
<t tx="ekr.20201219054931.258">#__pragma__ ('ifdef', '__complex__')

class complex:
    @others

def __conj__ (aNumber):
    if isinstance (aNumber, complex):
        return complex (aNumber.real, -aNumber.imag)
    else:
        return complex (aNumber, 0)
        
#__pragma__ ('endif')
</t>
<t tx="ekr.20201219054931.259">def __init__ (self, real, imag = None):
    if imag == None:
        if type (real) == complex:
            self.real = real.real
            self.imag = real.imag
        else:
            self.real = real
            self.imag = 0
    else:
        self.real = real
        self.imag = imag
        
</t>
<t tx="ekr.20201219054931.26">def getAdjacentClassScopes (self, inMethod = False):
    # Work backward until finding an interruption in the chain
    # Needed to fix destructuring assignment in nested classes and to make super () work
    # The latter needs inMethod, since supported use of super () is directly or indirectly enclosed in a method body
    reversedClassScopes = []
    for scope in reversed (self.scopes):
        if inMethod:
            if type (scope.node) in (ast.FunctionDef, ast.AsyncFunctionDef):
                continue
            else:
                inMethod = False

        if type (scope.node) != ast.ClassDef:
            break
        reversedClassScopes.append (scope)
    return reversed (reversedClassScopes)

</t>
<t tx="ekr.20201219054931.260">def __neg__ (self):
    return complex (-self.real, -self.imag)
    
</t>
<t tx="ekr.20201219054931.261">def __exp__ (self):
    modulus = Math.exp (self.real)
    return complex (modulus * Math.cos (self.imag), modulus * Math.sin (self.imag))

</t>
<t tx="ekr.20201219054931.262">def __log__ (self):
    return complex (Math.log (Math.sqrt (self.real * self.real + self.imag * self.imag)), Math.atan2 (self.imag, self.real))
    
</t>
<t tx="ekr.20201219054931.263">def __pow__ (self, other):  # a ** b = exp (b log a)
    return (self.__log__ () .__mul__ (other)) .__exp__ ()
    
</t>
<t tx="ekr.20201219054931.264">def __rpow__ (self, real):  # real ** comp -&gt; comp.__rpow__ (real)
    return self.__mul__ (Math.log (real)) .__exp__ ()
    
</t>
<t tx="ekr.20201219054931.265">def __mul__ (self, other):
    if __typeof__ (other) is 'number':
        return complex (self.real * other, self.imag * other)
    else:
        return complex (self.real * other.real - self.imag * other.imag, self.real * other.imag + self.imag * other.real)
    
</t>
<t tx="ekr.20201219054931.266">def __rmul__ (self, real):  # real + comp -&gt; comp.__rmul__ (real)
    return complex (self.real * real, self.imag * real)
    
</t>
<t tx="ekr.20201219054931.267">def __div__ (self, other):
    if __typeof__ (other) is 'number':
        return complex (self.real / other, self.imag / other)
    else:
        denom = other.real * other.real + other.imag * other.imag
        return complex (
            (self.real * other.real + self.imag * other.imag) / denom,
            (self.imag * other.real - self.real * other.imag) / denom
        )
    
</t>
<t tx="ekr.20201219054931.268">def __rdiv__ (self, real):  # real / comp -&gt; comp.__rdiv__ (real)
    denom = self.real * self.real
    return complex (
        (real * self.real) / denom,
        (real * self.imag) / denom
    )
    
</t>
<t tx="ekr.20201219054931.269">def __add__ (self, other):
    if __typeof__ (other) is 'number':
        return complex (self.real + other, self.imag)
    else:   # Assume other is complex
        return complex (self.real + other.real, self.imag + other.imag)
    
</t>
<t tx="ekr.20201219054931.27">def emitComma (self, index, blank = True):
    if self.noskipCodeGeneration and self.conditionalCodeGeneration and index:
        self.emit (', ' if blank else ',')

</t>
<t tx="ekr.20201219054931.270">def __radd__ (self, real):  # real + comp -&gt; comp.__radd__ (real)
    return complex (self.real + real, self.imag)
    
</t>
<t tx="ekr.20201219054931.271">def __sub__ (self, other):
    if __typeof__ (other) is 'number':
        return complex (self.real - other, self.imag)
    else:
        return complex (self.real - other.real, self.imag - other.imag)
    
</t>
<t tx="ekr.20201219054931.272">def __rsub__ (self, real):  # real - comp -&gt; comp.__rsub__ (real)
    return complex (real - self.real, -self.imag)
    
</t>
<t tx="ekr.20201219054931.273">def __repr__ (self):
    return '({}{}{}j)'.format (self.real, '+' if self.imag &gt;= 0 else '', self.imag)
        
</t>
<t tx="ekr.20201219054931.274">def __str__ (self):
    return __repr__ (self) [1 : -1]
    
</t>
<t tx="ekr.20201219054931.275">def __eq__ (self, other):
    if __typeof__ (other) is 'number':
        return self.real == other
    else:
        return self.real == other.real and self.imag == other.imag
    
</t>
<t tx="ekr.20201219054931.276">def __ne__ (self, other):
    if __typeof__ (other) is 'number':
        return self.real != other
    else:
        return self.real != other.real or self.imag != other.imag
    
</t>
<t tx="ekr.20201219054931.277">def conjugate (self):
    return complex (self.real, -self.imag)
    
</t>
<t tx="ekr.20201219054931.279">class __Terminal__:
    '''
    Printing to either the console or to html happens async, but is blocked
    by calling window.prompt.
    
    So while all input and print statements are encountered in normal
    order, the print's exit immediately without yet having actually printed.
    
    This means the next input takes control, blocking actual printing and
    so on indefinitely The effect is that everything's only printed after
    all inputs are done.
    
    To prevent that, what's needed is to only execute the next
    window.prompt after actual printing has been done.
    
    Since we've no way to find out when that is, a timeout is used.
    '''

    @others

__terminal__ = __Terminal__ ()

print = __terminal__.print
input = __terminal__.input
</t>
<t tx="ekr.20201219054931.28">def emitBeginTruthy (self):
    if self.allowConversionToTruthValue:
        self.emit ('__t__ (')

</t>
<t tx="ekr.20201219054931.280">def __init__ (self):
    self.buffer = ''

    try:
        self.element = document.getElementById ('__terminal__')
    except:
        self.element = None
        
    if self.element:
        self.element.style.overflowX = 'auto'
        self.element.style.boxSizing = 'border-box'
        self.element.style.padding = '5px'
        self.element.innerHTML = '_'
    
#__pragma__ ('kwargs')
    
</t>
<t tx="ekr.20201219054931.281">def print (self, *args, sep = ' ', end = '\n'):
    self.buffer = '{}{}{}'.format (self.buffer, sep.join ([str (arg) for arg in args]), end) [-4096 : ] 
    
    if self.element:
        self.element.innerHTML = self.buffer.replace ('\n', '&lt;br&gt;') .replace (' ', '&amp;nbsp')
        self.element.scrollTop = self.element.scrollHeight
    else:
        console.log (sep.join ([str (arg) for arg in args]))
    
</t>
<t tx="ekr.20201219054931.282">def input (self, question):
    self.print ('{}'.format (question), end = '')
    answer = window.prompt ('\n'.join (self.buffer.split ('\n') [-8:]))
    self.print (answer)
    return answer
    
#__pragma__ ('nokwargs')

</t>
<t tx="ekr.20201219054931.29">def emitEndTruthy (self):
    if self.allowConversionToTruthValue:
        self.emit (')')

</t>
<t tx="ekr.20201219054931.3">import os
import os.path
import sys
import ast
import re
import copy
import datetime
import math
import traceback
import io
import subprocess
import shlex
import shutil
import tokenize
import collections
import json

from org.transcrypt import utils, sourcemaps, minify, static_check, type_check

</t>
<t tx="ekr.20201219054931.30">def adaptLineNrString (self, node = None, offset = 0):
    if utils.commandArgs.map or utils.commandArgs.anno:
        # Under these conditions, appended line numbers will be stripped later, so they have to be there
        if node:
            if hasattr (node, 'lineno'):
                lineNr = node.lineno + offset   # Use new line number
            else:
                lineNr = self.lineNr + offset   # Use 'cached' line nubmer
        else:
            lineNr = 1 + offset

        self.lineNrString = str (sourcemaps.maxNrOfSourceLinesPerModule + lineNr) [1 : ]
    else:                                               
        # __pragma__ ('noanno') isn't enough to perform this else-clause and to later on take the 'no stripping' shortcut
        # This is in the main module the first line will already have been instrumented
        # So in that case each line is instrumented and instrumentation will be stripped later on
        self.lineNrString = ''

</t>
<t tx="ekr.20201219054931.31">def isCommentString (self, statement):
    return isinstance (statement, ast.Expr) and isinstance (statement.value, ast.Str)

</t>
<t tx="ekr.20201219054931.32">def emitBody (self, body):
    for statement in body:
        if self.isCommentString (statement):
            pass
        else:
            self.visit (statement)
            self.emit (';\n')

</t>
<t tx="ekr.20201219054931.33">def emitSubscriptAssign (self, target, value, emitPathIndices = lambda: None):
    if type (target.slice) == ast.Index:        # Always overloaded
        if type (target.slice.value) == ast.Tuple:
            self.visit (target.value)
            self.emit ('.__setitem__ (')        # Free function tries .__setitem__ (overload) and [] (native)
            self.stripTuple = True
            self.visit (target.slice.value)
            self.emit (', ')
            self.visit (value)
            emitPathIndices ()
            self.emit (')')
        elif self.allowOperatorOverloading:     # Possibly overloaded LHS index dealt with here, is special case
            self.emit ('__setitem__ (')         # Free function tries .__setitem__ (overload) and [] (native)
            self.visit (target.value)
            self.emit (', ')
            self.visit (target.slice.value)
            self.emit (', ')
            self.visit (value)
            emitPathIndices ()
            self.emit (')')
        else:                                   # Non-overloaded LHS index just dealt with by visit_Subscript
                                                # which is called indirectly here
            self.expectingNonOverloadedLhsIndex = True
            self.visit (target)
            self.emit (' = ')
            self.visit (value)
            emitPathIndices ()
    elif type (target.slice) == ast.Slice:
        if self.allowOperatorOverloading:
            self.emit ('__setslice__ (')        # Free function tries .__setitem__ (overload) and .__setslice__ (native)
            self.visit (target.value)
            self.emit (', ')
        else:
            self.visit (target.value)
            self.emit ('.__setslice__ (')

        if target.slice.lower == None:
            self.emit ('0')
        else:
            self.visit (target.slice.lower)
        self.emit (', ')

        if target.slice.upper == None:
            self.emit ('null')
        else:
            self.visit (target.slice.upper)
        self.emit (', ')

        if target.slice.step:
            self.visit (target.slice.step)
        else:
            self.emit ('null')                  # Must be null rather than 1, see Array.prototype.__setslice__
        self.emit (', ')

        self.visit (value)

        self.emit (')')
    elif type (target.slice) == ast.ExtSlice:   # Always overloaded
        self.visit (target.value)
        self.emit ('.__setitem__ (')            # Method, since extended slice access is always overloaded
        self.emit ('[')
        for index, dim in enumerate (target.slice.dims):
            self.emitComma (index)
            self.visit (dim)
        self.emit (']')
        self.emit (', ')
        self.visit (value)
        self.emit (')')

</t>
<t tx="ekr.20201219054931.34">def nextTemp (self, name):
    if name in self.tempIndices:
        self.tempIndices [name] += 1
    else:
        self.tempIndices [name] = 0
    return self.getTemp (name)

</t>
<t tx="ekr.20201219054931.35">def skipTemp (self, name):
    self.skippedTemps.add (self.nextTemp (name))

</t>
<t tx="ekr.20201219054931.36">def skippedTemp (self, name):
    return self.getTemp (name) in self.skippedTemps

</t>
<t tx="ekr.20201219054931.37">def getTemp (self, name):
    if name in self.tempIndices:
        return '__{}{}__'.format (name, self.tempIndices [name])
    else:
        return None

</t>
<t tx="ekr.20201219054931.38">def prevTemp (self, name):
    if self.getTemp (name) in self.skippedTemps:
        self.skippedTemps.remove (self.getTemp (name))

    self.tempIndices [name] -= 1
    if self.tempIndices [name] &lt; 0:
        del self.tempIndices [name]

</t>
<t tx="ekr.20201219054931.39">def useModule (self, name):
    self.module.program.importStack [-1][1] = self.lineNr               # Remember line nr of import statement for the error report
    return self.module.program.provide (name, filter = self.filterId)   # Must be done first because it can generate a healthy exception

</t>
<t tx="ekr.20201219054931.4">inIf = False
ecom = True
noecom = False

dataClassDefaultArgTuple = (
    ['init', True],
    ['repr', True],
    ['eq', True],
    ['order', False],
    ['unsafe_hash', False],
    ['frozen', False],
)
</t>
<t tx="ekr.20201219054931.40">def isCall (self, node, name):
    return type (node) == ast.Call and type (node.func) == ast.Name and node.func.id == name

</t>
<t tx="ekr.20201219054931.41">def getPragmaFromExpr (self, node):
    return node.value.args if type (node) == ast.Expr and self.isCall (node.value, '__pragma__') else None

</t>
<t tx="ekr.20201219054931.42">def getPragmaFromIf (self, node):
    return node.test.args if type (node) == ast.If and self.isCall (node.test, '__pragma__') else None

</t>
<t tx="ekr.20201219054931.43">def visit (self, node):             # Overrides visit () method of parent ast.NodeVisitor
    try:
        # Adapt self.lineNr to each visited node
        # The lineNr is used in line number annotations and in error reports
        # In case of hoisting the line number of the source code will have to be remembered until the hoist is dealt with

        self.lineNr = node.lineno
    except:
        pass

    pragmaInIf = self.getPragmaFromIf (node)
    pragmaInExpr = self.getPragmaFromExpr (node)

    if pragmaInIf:
        if pragmaInIf [0] .s == 'defined':
            for symbol in pragmaInIf [1:]:
                if symbol.s in self.module.program.symbols:
                    definedInIf = True
                    break
            else:
                definedInIf = False
    elif pragmaInExpr:
        if pragmaInExpr [0] .s == 'skip':
            self.noskipCodeGeneration = False
        elif pragmaInExpr [0] .s == 'noskip':
            self.noskipCodeGeneration = True

        if pragmaInExpr [0] .s in ('ifdef', 'ifndef'):
            definedInExpr = eval (    # Explained with __pragma__ ('js', ...)
                compile (
                    ast.Expression (pragmaInExpr [1]),
                    '&lt;string&gt;',
                    'eval'
                ),
                {},
                {'__envir__': self.module.program.envir}
            ) in self.module.program.symbols

        if pragmaInExpr [0] .s == 'ifdef':
            self.conditionalCodeGeneration = definedInExpr
        elif pragmaInExpr [0] .s == 'ifndef':
            self.conditionalCodeGeneration = not definedInExpr
        elif pragmaInExpr [0] .s == 'else':
            self.conditionalCodeGeneration = not self.conditionalCodeGeneration
        elif pragmaInExpr [0] .s == 'endif':
            self.conditionalCodeGeneration = True

    if self.noskipCodeGeneration and self.conditionalCodeGeneration:
        if pragmaInIf:
            if definedInIf:
                self.emitBody (node.body)
        else:
            super () .visit (node)

</t>
<t tx="ekr.20201219054931.44">def visit_arg (self, node):
    self.emit (self.filterId (node.arg))

</t>
<t tx="ekr.20201219054931.45">def visit_arguments (self, node):   # Visited for def's, not for calls
    self.emit ('(')

    for index, arg in enumerate (node.args):
        self.emitComma (index)
        self.visit (arg)

    # If there's a vararg or a kwarg, no formal parameter is emitted for it, it's just retrieved in the body
    # so def f (a, b=3, *x, c, d=4, **y, e, f = 5) generates function f (a, b, c, d, e, f), since x and y are never passed in positionally

    self.emit (') {{\n')

    self.indent ()  # Start of function body, the end is not in visit_arguments

    # Defaults for positional args (before *), only if not passed normally before this point
    # They can also be passed in as keyword args
    # If so, the keywords are filled in starting with the last positional arg
    # So after a keyword positional arg cannot follow a non-keyword positional arg
    # The kwarg transfer object may be the last of the actual params
    # It should not initialize a formal param, so it's overwritten by the default as well.
    for arg, expr in reversed (list (zip (reversed (node.args), reversed (node.defaults)))):
        if expr:
            # If a default expr is given for this arg

            # Condition for using that default expr:
            # - no actual param value has been passed for this formal param in the call
            # or
            # - the actual param has property __kwargtrans__ (is marked a __kwargtrans__ object)
            # The latter is because the __kwargtrans__ object isn't a 'regular' actual param, so shouldn't be assigned to any formal param
            # Since the formal param "who's turn it was" does not get an actual value, it'll have to be satisfied with its default expr
            self.emit ('if (typeof {0} == \'undefined\' || ({0} != null &amp;&amp; {0}.hasOwnProperty ("__kwargtrans__"))) {{;\n', self.filterId (arg.arg))

            self.indent ()
            self.emit ('var {} = ', self.filterId (arg.arg))
            self.visit (expr)
            self.emit (';\n')
            self.dedent ()
            self.emit ('}};\n')

    # Defaults for kwonly args (after *), unconditionally, since they will be passed only after this point
    for arg, expr in zip (node.kwonlyargs, node.kw_defaults):
        if expr:
            self.emit ('var {} = ', self.filterId (arg.arg))
            self.visit (expr)
            self.emit (';\n')

    if self.allowKeywordArgs:
        # If there is a **kwargs arg, make a local to hold its calltime contents
        # This local is needed even if arguments.length == 0, it's just empty then but may be read or passed on
        if node.kwarg:
            self.emit ('var {} = dict ();\n', self.filterId (node.kwarg.arg))

        self.emit ('if (arguments.length) {{\n')
        self.indent ()

        # Store index of last actual param
        self.emit ('var {} = arguments.length - 1;\n', self.nextTemp ('ilastarg'))

        # Any calltime keyword args are passed in a special JavaScript-only kwarg transfer object, recognizable by attribute __kwargtrans__
        # If it's there, copy this special object into local var __allkwargs__
        # And lower __ilastarg__ by 1, since the last calltime arg wasn't a normal (Python) one
        # It's only known at call time if there are keyword arguments, unless there are no arguments at all, so always have to generate this code
        self.emit ('if (arguments [{0}] &amp;&amp; arguments [{0}].hasOwnProperty ("__kwargtrans__")) {{\n', self.getTemp ('ilastarg'))
        self.indent ()
        self.emit ('var {} = arguments [{}--];\n', self.nextTemp ('allkwargs'), self.getTemp ('ilastarg'))

        # kwarg transfer object may contain deftime defined keyword args, but also keyword args that are absorbed by **kwargs
        self.emit ('for (var {} in {}) {{\n', self.nextTemp ('attrib'), self.getTemp ('allkwargs'))
        self.indent ()

        # We'll make the distinction between normal keyword args and **kwargs keyword args in a switch
        if node.args + node.kwonlyargs or node.kwarg:
            self.emit ('switch ({}) {{\n', self.getTemp ('attrib'))
            self.indent ()

            # First generate a case for each normal keyword arg, generating a local for it
            for arg in node.args + node.kwonlyargs:
                self.emit ('case \'{0}\': var {0} = {1} [{2}]; break;\n',
                    self.filterId (arg.arg),
                    self.getTemp ('allkwargs'),
                    self.getTemp ('attrib'))

            # Then put the rest into the **kwargs local
            if node.kwarg:
                self.emit ('default: {0} [{1}] = {2} [{1}];\n',
                    self.filterId (node.kwarg.arg),
                    self.getTemp ('attrib'),
                    self.getTemp ('allkwargs'))

            self.dedent ()
            self.emit ('}}\n')  # switch..

        self.prevTemp ('allkwargs')
        self.prevTemp ('attrib')

        self.dedent ()
        self.emit ('}}\n')  # for (__attrib__..

        # Take out the __kwargstrans__ marker, to prevent it from being passed in to another call, leading to confusion there
        # So after being used once, the kwarg transfer object becomes an ordinary object
        if node.kwarg:
            self.emit ('delete {}.__kwargtrans__;\n', self.filterId (node.kwarg.arg))

        self.dedent ()
        self.emit ('}}\n')  # if (arguments [{0}]..

        # If there's a vararg, assign an array containing the remainder of the actual non keyword only params, except for the kwarg transfer object
        if node.vararg:
            # Slice starts at end of formal positional params, ends with last actual param, all actual keyword args are taken out into the kwarg transfer object
            self.emit (
                'var {} = tuple ([].slice.apply (arguments).slice ({}, {} + 1));\n',
                self.filterId (node.vararg.arg),
                len (node.args),
                self.getTemp ('ilastarg')
            )

        self.prevTemp ('ilastarg')

        self.dedent ()
        self.emit ('}}\n')  # if (arguments.length..
        self.emit ('else {{\n')
        self.indent ()
        if node.vararg:     # if there's a formal vararg param, even if there isn't an actual one
            self.emit ('var {} = tuple ();\n', self.filterId (node.vararg.arg))
        self.dedent ()
        self.emit ('}}\n')
    else:
        if node.vararg: # See above
            self.emit (
                'var {} = tuple ([].slice.apply (arguments).slice ({}));\n',
                self.filterId (node.vararg.arg),
                len (node.args),
            )

</t>
<t tx="ekr.20201219054931.46">def visit_AnnAssign (self, node):
    if node.value != None:  # Rather than node.value is a NameConstant with value None
        self.visit (
            ast.Assign (
                [node.target],
                node.value
            )
        )

</t>
<t tx="ekr.20201219054931.47">def visit_Assert (self, node):
    if utils.commandArgs.dassert:
        self.emit ('assert (')
        self.visit (node.test)
        if node.msg:
            self.emit (', ')
            self.visit (node.msg)
        self.emit (');\n')

</t>
<t tx="ekr.20201219054931.48">def visit_Assign (self, node):
    self.adaptLineNrString (node)

    targetLeafs = (ast.Attribute, ast.Subscript, ast.Name)

    def assignTarget (target, value, pathIndices = []):
        def emitPathIndices ():
            if pathIndices:
                self.emit (' ')
                for pathIndex in pathIndices:
                    self.emit ('[{}]'.format (pathIndex))
            else:   # Most frequent and simple case, only one atomary LHS
                pass

        if type (target) == ast.Subscript:              # Only non-overloaded LHS index can be left to visit_Subscript
            self.emitSubscriptAssign (target, value, emitPathIndices)
        else:
            if isPropertyAssign and target.id != self.getTemp ('left'):
                self.emit ('Object.defineProperty ({}, \'{}\', '.format (self.getScope () .node.name, target.id))
                self.visit (value)
                emitPathIndices ()
                self.emit (')')
            else:
                if type (target) == ast.Name:
                    if type (self.getScope () .node) == ast.ClassDef and target.id != self.getTemp ('left'):
                        self.emit ('{}.'.format ('.'.join ([scope.node.name for scope in self.getAdjacentClassScopes ()]))) # The target is a class attribute
                    elif target.id in self.getScope () .nonlocals:
                        pass
                    else:
                        if type (self.getScope () .node) == ast.Module: # Redundant but regular
                            if hasattr (node, 'parentNode') and type (node.parentNode) == ast.Module and not target.id in self.allOwnNames:
                                self.emit ('export ')
                        self.emit ('var ')
                self.visit (target)
                self.emit (' = ')
                self.visit (value)
                emitPathIndices ()

    # Tuple assignment LHS tree walker
    # The target (LHS) guides the walk, so it determines the source indices
    # However if a target leaf is an LHS slice,
    # the actual assignment will involve iterating through an extra index level,
    # as [1, 2][1:1] = [2, 3] should give [1, 2, 3, 4] rather than [1, [2, 3], 4]
    # This extra target level is walked in the slice
    def walkTarget (expr, pathIndices):
        if type (expr) in targetLeafs:          # It's an LValue, matching an RHS leaf source
            self.emit (';\n')

            # Create and visit RHS node on the fly, to benefit from assignTarget
            assignTarget (expr, ast.Name (
                id = self.getTemp ('left'),
                ctx = ast.Load
            ), pathIndices)
        else:                                   # It's a sequence
            pathIndices.append (None)           # Add indexing level for that sequence
            for index, elt in enumerate (expr.elts):
                pathIndices [-1] = index
                walkTarget (elt, pathIndices)   # Walk deeper until finally pathIndices is used in emitting an RHS leaf
            pathIndices.pop ()                  # Remove the indexing level since we're done with that sequence

    def getIsPropertyAssign (value):
        if self.isCall (value, 'property'):
            return True
        else:
            try:    # Assume it's a tuple or a list of properties (and so recursively)
                return getIsPropertyAssign (value.elts [0])

            except: # At this point it wasn't a property and also not a tuple or a list of properties
                return False

    isPropertyAssign = type (self.getScope () .node) == ast.ClassDef and getIsPropertyAssign (node.value)
    # In transpiling to efficient JavaScript, we need a special, simplified case for properties
    # In JavaScript generating '=' for properties won't do, it has to be 'Object.defineProperty'
    # We can't look out for property installation at runtime, that would make all assignments slow
    # So we introduce the restriction that an assignment involves no properties at all or only properties
    # Also these properties have to use the 'property' function 'literally'
    # With these restrictions we can recognize property installation at compile time

    if len (node.targets) == 1 and type (node.targets [0]) in targetLeafs:
        # Fast shortcut for the most frequent and simple case
        assignTarget (node.targets [0], node.value)
    else:
        # Multiple RHS or tuple assignment, we need __tmp__, create assignment node on the fly and visit it
        self.visit (ast.Assign (
            targets = [ast.Name (
                id = self.nextTemp ('left'),
                ctx = ast.Store
            )],
            value = node.value
        ))

        for expr in node.targets:
            walkTarget (expr, [])

        self.prevTemp ('left')

</t>
<t tx="ekr.20201219054931.49">def visit_Attribute (self, node):
    if type (node.value) in (ast.BinOp, ast.BoolOp, ast.Compare):
        self.emit ('(')

    self.visit (node.value)

    if type (node.value) in (ast.BinOp, ast.BoolOp, ast.Compare):
        self.emit (')')

    self.emit ('.{}', self.filterId (node.attr))

</t>
<t tx="ekr.20201219054931.5">class Program:
    @others
</t>
<t tx="ekr.20201219054931.50">def visit_Await (self, node):
    self.emit ('await ')
    self.visit (node.value)

</t>
<t tx="ekr.20201219054931.51">def visit_AugAssign (self, node):
    if self.allowOperatorOverloading:
        rhsFunctionName = self.filterId (
            # Non-overloaded
            '__ipow__' if type (node.op) == ast.Pow else
            '__imatmul__' if type (node.op) == ast.MatMult else
            ('__ijsmod__' if self.allowJavaScriptMod else '__imod__') if type (node.op) == ast.Mod else

            # Overloaded arithmetic
            '__imul__' if type (node.op) == ast.Mult else
            '__idiv__' if type (node.op) == ast.Div else
            '__iadd__' if type (node.op) == ast.Add else
            '__isub__' if type (node.op) == ast.Sub else

            # Overloaded bitwise
            '__ilshift__' if type (node.op) == ast.LShift else
            '__irshift__' if type (node.op) == ast.RShift else
            '__ior__' if type (node.op) == ast.BitOr else
            '__ixor__' if type (node.op) == ast.BitXor else
            '__iand__' if type (node.op) == ast.BitAnd else

            'Never here'
        )

        rhsCall = ast.Call (
            func = ast.Name (
                id = rhsFunctionName,
                ctx = ast.Load
            ),
            args = [
                node.target,
                node.value
            ],
            keywords = []
        )

        if type (node.target) == ast.Subscript:              # Only non-overloaded LHS index can be left to visit_Subscript
            self.emitSubscriptAssign (node.target, rhsCall)
        else:
            if type (node.target) == ast.Name and not node.target.id in self.getScope () .nonlocals:
                self.emit ('var ')

            self.visit (node.target)
            self.emit (' = ')
            self.visit (rhsCall)
    elif (
        # Python //, @ and ** have no operator symbol in JavaScript, so &lt;operator&gt;= won't work
        type (node.op) in (ast.FloorDiv, ast.MatMult, ast.Pow)
        or
        # Python % (as opposed to JavaScript %) has no operator symbol in JavaScript, so &lt;operator&gt;= won't work
        (type (node.op) == ast.Mod and not self.allowJavaScriptMod)
        or
        # LHS is a call to __getitem__ or __getslice__, so &lt;operator&gt;= won't work
        (
            type (node.target) == ast.Subscript and (
                type (node.target.slice) != ast.Index or
                type (node.target.slice.value) == ast.Tuple
            )
        )
    ):
        # Just translate to binary operator node
        self.visit (ast.Assign (
            targets = [node.target],
            value = ast.BinOp (left = node.target, op = node.op, right = node.value)
        ))
    else:   # No overloading in this branch
        self.expectingNonOverloadedLhsIndex = True
        self.visit (node.target)        # No need to emit var first, it has to exist already

        # Optimize for ++ and --
        if type (node.value) == ast.Num and node.value.n == 1:
            if type (node.op) == ast.Add:
                self.emit ('++')
                return
            elif type (node.op) == ast.Sub:
                self.emit ('--')
                return
        elif type (node.value) == ast.UnaryOp and type (node.value.operand) == ast.Num and node.value.operand.n == 1:
            if type (node.op) == ast.Add:
                if type (node.value.op) == ast.UAdd:
                    self.emit ('++')
                    return
                elif type (node.value.op) == ast.USub:
                    self.emit ('--')
                    return
            elif type (node.op) == ast.Sub:
                if type (node.value.op) == ast.UAdd:
                    self.emit ('--')
                    return
                elif type (node.value.op) == ast.USub:
                    self.emit ('++')
                    return

        self.emit (' {}= ', self.operators [type (node.op)][0])
        self.visit (node.value)

</t>
<t tx="ekr.20201219054931.52">def visit_BinOp (self, node):
    if type (node.op) == ast.FloorDiv:
        if self.allowOperatorOverloading:
            self.emit ('__floordiv__ (')
            self.visitSubExpr (node, node.left)
            self.emit (', ')
            self.visitSubExpr (node, node.right)
            self.emit (')')
        else:
            self.emit ('Math.floor (')
            self.visitSubExpr (node, node.left)
            self.emit (' / ')
            self.visitSubExpr (node, node.right)
            self.emit (')')
    elif (
        type (node.op) in (ast.Pow, ast.MatMult) or
        (type (node.op) == ast.Mod and (self.allowOperatorOverloading or not self.allowJavaScriptMod)) or
        (type (node.op) in (
            ast.Mult, ast.Div, ast.Add, ast.Sub,
            ast.LShift, ast.RShift, ast.BitOr, ast.BitXor, ast.BitAnd
        ) and self.allowOperatorOverloading)
    ):
        self.emit ('{} ('.format (self.filterId (
            # Non-overloaded
            ('__floordiv__' if self.allowOperatorOverloading else 'Math.floor') if type (node.op) == ast.FloorDiv else
            ('__pow__' if self.allowOperatorOverloading else 'Math.pow') if type (node.op) == ast.Pow else
            '__matmul__' if type (node.op) == ast.MatMult else
            ('__jsmod__' if self.allowJavaScriptMod else '__mod__') if type (node.op) == ast.Mod else

            # Overloaded arithmetic
            '__mul__' if type (node.op) == ast.Mult else
            '__truediv__' if type (node.op) == ast.Div else
            '__add__' if type (node.op) == ast.Add else
            '__sub__' if type (node.op) == ast.Sub else

            # Overloaded bitwise
            '__lshift__' if type (node.op) == ast.LShift else
            '__rshift__' if type (node.op) == ast.RShift else
            '__or__' if type (node.op) == ast.BitOr else
            '__xor__' if type (node.op) == ast.BitXor else
            '__and__' if type (node.op) == ast.BitAnd else

            'Never here'
        )))
        self.visit (node.left)
        self.emit (', ')
        self.visit (node.right)
        self.emit (')')
    else:
        self.visitSubExpr (node, node.left)
        self.emit (' {} '.format (self.operators [type (node.op)][0]))
        self.visitSubExpr (node, node.right)

</t>
<t tx="ekr.20201219054931.53">def visit_BoolOp (self, node):
    for index, value in enumerate (node.values):
        if index:
            self.emit (' {} '.format (self.operators [type (node.op)][0]))

        if index &lt; len (node.values) - 1:
            self.emitBeginTruthy ()

        self.visitSubExpr (node, value)

        if index &lt; len (node.values) - 1:
            self.emitEndTruthy ()

</t>
<t tx="ekr.20201219054931.54">def visit_Break (self, node):
    if not self.skippedTemp ('break'):
        self.emit ('{} = true;\n', self.getTemp ('break'))
    self.emit ('break')

</t>
<t tx="ekr.20201219054931.55">def visit_Bytes (self, node):
    self.emit ('bytes (\'{}\')', node.s.decode ('ASCII'))

</t>
<t tx="ekr.20201219054931.56">def visit_Call (self, node, dataClassArgDict = None):
    self.adaptLineNrString (node)

    def emitKwargTrans ():
        self.emit ('__kwargtrans__ (')

        hasSeparateKeyArgs = False
        hasKwargs = False
        for keyword in node.keywords:
            if keyword.arg:
                hasSeparateKeyArgs = True
            else:
                hasKwargs = True
                break   # **kwargs is always the last arg

        if hasSeparateKeyArgs:
            if hasKwargs:
                self.emit ('__mergekwargtrans__ (')
            self.emit ('{{')    # Allways if hasSeparateKeyArgs

        for keywordIndex, keyword in enumerate (node.keywords):
            if keyword.arg:
                self.emitComma (keywordIndex)
                self.emit ('{}: ', self.filterId (keyword.arg))
                self.visit (keyword.value)
            else:
                # It's the **kwargs arg, so the last arg
                # In JavaScript this must be an expression denoting an Object
                # The keyword args in there have to be added to the kwargs transfer object as well
                if hasSeparateKeyArgs:
                    self.emit ('}}, ')
                self.visit (keyword.value)

        if hasSeparateKeyArgs:
            if hasKwargs:
                self.emit (')')     # Terminate merge
            else:
                self.emit ('}}')    # Only if not terminated already because hasKwargs

        self.emit (')')

    def include (fileName):
        try:
            searchedIncludePaths = []
            for searchDir in self.module.program.moduleSearchDirs:
                filePath = '{}/{}'.format (searchDir, fileName)
                if os.path.isfile (filePath):
                    includedCode = tokenize.open (filePath) .read ()
                    if fileName.endswith ('.js'):
                        # Only leave comments in in case of a dnostrip and not anno, the latter to prevent nested comments
                        includedCode = utils.digestJavascript (includedCode, self.module.program.symbols, not utils.commandArgs.dnostrip or utils.commandArgs.anno, self.allowDebugMap) .digestedCode
                    return includedCode
                else:
                    searchedIncludePaths.append (filePath)
            else:
                raise utils.Error (
                    lineNr = self.lineNr,
                    message = '\n\tAttempt to include file: {}\n\tCan\'t find any of:\n\t\t{}\n'.format (
                        node.args [0], '\n\t\t'. join (searchedIncludePaths)
                    )
                )
        except:
            print (traceback.format_exc ())

    # For a start, some special cases of calls to follow
    if type (node.func) == ast.Name:

        # type () function
        if node.func.id == 'type':
            self.emit ('py_typeof (')   # Don't use general alias, since this is the type operator, not the type metaclass
            self.visit (node.args [0])
            self.emit (')')
            return

        #property () factory function
        elif node.func.id == 'property':
            self.emit ('{0}.call ({1}, {1}.{2}'.format (node.func.id, self.getScope (ast.ClassDef) .node.name, self.filterId (node.args [0].id)))
            if len (node.args) &gt; 1:
                self.emit (', {}.{}'.format (self.getScope (ast.ClassDef) .node.name, node.args [1].id))
            self.emit (')')
            return

        # globals () function
        elif node.func.id == 'globals':
            # self.emit ('__globals__ (__all__)') # ??? Is __globals__ (__all__) needed or does __all___ suffice?
            self.emit ('__all__') # y18m08d23 Variable __all__ created as a dict itself
            return
        # __pragma__'s in many varieties, syntactically calls, but semantically compile time directives
        elif node.func.id == '__pragma__':
            if node.args [0] .s == 'alias':
                self.aliases.insert (0, (node.args [1] .s, node.args [2] .s))
            elif node.args [0] .s == 'noalias':
                if len (node.args) == 1:
                    self.aliases = []
                else:
                    for index in reversed (range (len (self.aliases))):
                        if self.aliases [index][0] == node.args [1] .s:
                            self.aliases.pop (index)

            elif node.args [0] .s == 'noanno':
                self.allowDebugMap = False

            elif node.args [0] .s == 'fcall':
                self.allowMemoizeCalls = True
            elif node.args [0] .s == 'nofcall':
                self.allowMemoizeCalls = False

            elif node.args [0] .s == 'docat':
                self.allowDocAttribs = True
            elif node.args [0] .s == 'nodocat':
                self.allowDocAttribs = False

            elif node.args [0] .s == 'iconv':       # Automatic conversion to iterable supported
                self.allowConversionToIterable = True
            elif node.args [0] .s == 'noiconv':     # Automatic conversion to iterable not supported
                self.allowConversionToIterable = False

            elif node.args [0] .s == 'jsiter':      # Translate for ... in ... : ... literally to for (... in ...) {...},
                self.allowJavaScriptIter = True     # to enable iterating JavaScript objects that are not dicts
            elif node.args [0] .s == 'nojsiter':    # Dictionary keys without quotes are identifiers
                self.allowJavaScriptIter = False

            elif node.args [0] .s == 'jscall':      # Python calls get compiled to direct JavaScript calls
                self.allowJavaScriptCall = True
            elif node.args [0] .s == 'nojscall':    # Python calls get compiled to calls via a JavaScript property, allowing bound method assignment
                self.allowJavaScriptCall = False

            elif node.args [0] .s == 'jskeys':      # Dictionary keys without quotes are string literals
                self.allowJavaScriptKeys = True
            elif node.args [0] .s == 'nojskeys':    # Dictionary keys without quotes are identifiers
                self.allowJavaScriptKeys = False

            elif node.args [0] .s == 'keycheck':    # Nonexistent dict keys or list indices generate an exception
                self.allowKeyCheck = True
            elif node.args [0] .s == 'nokeycheck':  # Nonexistent dict keys or list indices produce undefined values
                self.allowKeyCheck = False

            elif node.args [0] .s == 'jsmod':       # % has JavaScript behaviour
                self.allowJavaScriptMod = True
            elif node.args [0] .s == 'nojsmod':     # % has Python behaviour
                self.allowJavaScriptMod = False

            elif node.args [0] .s == 'gsend':       # Replace send by next.value
                self.replaceSend = True
            elif node.args [0] .s == 'nogsend':     # Don't replace send by next.value
                self.replaceSend = False

            elif node.args [0] .s == 'tconv':       # Automatic conversion to truth value supported
                self.allowConversionToTruthValue = True
            elif node.args [0] .s == 'notconv':     # Automatic conversion to truth value not supported
                self.allowConversionToTruthValue = False

            elif node.args [0] .s == 'run':
                pass
            elif node.args [0] .s == 'norun':
                pass

            elif node.args [0] .s == 'js':          # Include JavaScript code literally in the output
                try:
                    try:
                        code = node.args [1] .s.format (* [
                            eval (
                                compile (
                                    ast.Expression (arg),   # Code to compile (can be AST or source)
                                    '&lt;string&gt;',             # Not read from a file
                                    'eval'                  # Code is an expression, namely __include__  (&lt;fileName&gt;) in most cases
                                ),
                                {},
                                {'__include__': include}
                            )
                            for arg in node.args [2:]
                        ])
                    except: # ??? If this is dealt with the regular way, a missing lineno is reported. Why?
                        code = node.args [2] .s
                    for line in code.split ('\n'):
                        self.emit ('{}\n', line)
                except:
                    print (traceback.format_exc ())

            elif node.args [0] .s == 'xtrans':       # Include code transpiled by external process in the output
                try:
                    sourceCode = node.args [2] .s.format (* [
                        eval (
                            compile (
                                ast.Expression (arg),   # Code to compile (can be AST or source)
                                '&lt;string&gt;',             # Not read from a file
                                'eval'                  # Code is an expression, namely __include__  (&lt;fileName&gt;) in most cases
                            ),
                            {},
                            {'__include__': include}
                        )
                        for arg in node.args [3:]
                    ])
                    workDir = '.'
                    for keyword in node.keywords:
                        if keyword.arg == 'cwd':
                            workDir = keyword.value.s
                    process = subprocess.Popen (
                        shlex.split(node.args [1] .s),
                        stdin = subprocess.PIPE,
                        stdout = subprocess.PIPE,
                        cwd = workDir
                    )
                    process.stdin.write ((sourceCode).encode ('utf8'))
                    process.stdin.close ()
                    while process.returncode is None:
                        process.poll ()
                    targetCode = process.stdout.read (). decode ('utf8'). replace ('\r\n', '\n')
                    for line in targetCode.split ('\n'):
                        self.emit ('{}\n', line)
                except:
                    print (traceback.format_exc ())

            elif node.args [0] .s == 'xglobs':      # Allow use of the 'globals' function for this whole module
                self.allowGlobals = True
            elif node.args [0] .s == 'noxglobs':    # Disallow use of the 'globals' funciton for this whole module
                self.allowGlobals = False

            elif node.args [0] .s == 'kwargs':      # Start emitting kwargs code for FunctionDef's
                self.allowKeywordArgs = True
            elif node.args [0] .s == 'nokwargs':    # Stop emitting kwargs code for FunctionDef's
                self.allowKeywordArgs = False

            elif node.args [0] .s == 'opov':        # Overloading of a small sane subset of operators allowed
                self.allowOperatorOverloading = True
            elif node.args [0] .s == 'noopov':      # Operloading of a small sane subset of operators disallowed
                self.allowOperatorOverloading = False

            elif node.args [0] .s == 'redirect':
                if node.args [1] .s == 'stdout':
                    self.emit ('__stdout__ = \'{}\'', node.args [2])
            elif node.args [0] .s == 'noredirect':
                if node.args [1] .s == 'stdout':
                    self.emit ('__stdout__ = \'__console__\'')

            elif node.args [0] .s in ('skip', 'noskip', 'defined', 'ifdef', 'ifndef', 'else', 'endif'):
                pass                                # Easier dealt with on statement / expression level in self.visit

            elif node.args [0] .s == 'xpath':
                self.module.program.moduleSearchDirs [1 : 1] = [elt.s for elt in node.args [1] .elts]

            else:
                raise utils.Error (
                    lineNr = self.lineNr,
                    message = '\n\tUnknown pragma: {}'.format (
                        node.args [0] .s if type (node.args [0]) == ast.Str else node.args [0]
                    )
                )
            return
        # __new__ () 'call' to generate JavaScript's new operator
        elif node.func.id == '__new__':
            self.emit ('new ')
            self.visit (node.args [0])
            return
        # __typeof__ () 'call' will generate JavaScript's typeof operator
        elif node.func.id == '__typeof__':
            self.emit ('typeof ')
            self.visit (node.args [0])
            return

        # __preinc__ () will emit ++&lt;operand&gt;, for speed, e.g. in NumScrypt
        elif node.func.id == '__preinc__':
            self.emit ('++')
            self.visit (node.args [0])
            return

        # __postinc__ () will emit &lt;operand&gt;++,
        elif node.func.id == '__postinc__':
            self.visit (node.args [0])
            self.emit ('++')
            return
        # __predec__ () will emit --&lt;operand&gt;
        elif node.func.id == '__predec__':
            self.emit ('--')
            self.visit (node.args [0])
            return
        # __postdec__ () will emit &lt;operand&gt;
        elif node.func.id == '__postdec__':
            self.visit (node.args [0])
            self.emit ('--')
            return

    # conjugate () call, for complex numbers, will generate __conj__ () call to runtime
    elif (
        type (node.func) == ast.Attribute and
        node.func.attr == 'conjugate'
    ):
        try:
            self.visit (
                ast.Call (
                    func = ast.Name (
                        id = '__conj__',
                        ctx = ast.Load
                    ),
                    args = [node.func.value],
                    keywords = []
                )
            )
            return
        except:
            print (traceback.format_exc ())
    # send () call
    elif (
        type (node.func) == ast.Attribute and
        self.replaceSend and
        node.func.attr == 'send'                # Construct Attribute instead of bare Call node on the fly and visit it
    ):
        self.emit ('(function () {{return ')    # Encapsulate in function to prevent minifier complaining if value isn't used
        self.visit (ast.Attribute (
            value = ast.Call (
                func = ast.Attribute (
                    value = ast.Name (
                        id = node.func.value.id,
                        ctx = ast.Load
                    ),
                    attr = 'js_next',
                    ctx = ast.Load
                ),
                args = node.args,
                keywords = node.keywords
            ),
            attr = 'value',
            ctx = ast.Load
        ))
        self.emit ('}}) ()')
        return  # The newly created node was visited by a recursive call to visit_Call. This replaces the current visit.


    # super () call
    elif (
        type (node.func) == ast.Attribute and
        type (node.func.value) == ast.Call and
        type (node.func.value.func) == ast.Name and
        node.func.value.func.id == 'super'
    ):

        if node.func.value.args or node.func.value.keywords:
            raise utils.Error (
                lineNr = self.lineNr,
                message = '\n\tBuilt in function \'super\' with arguments not supported'
            )

        else:   # Construct node for __super__ (self, '&lt;methodName&gt;')(self, &lt;params&gt;) and visit it
            self.visit (
                ast.Call (
                    func = ast.Call (
                        func = ast.Name (
                            id = '__super__',
                            ctx = ast.Load
                        ),
                        args = [
                            ast.Name (
                                id = '.'.join ([scope.node.name for scope in self.getAdjacentClassScopes (True)]),
                                ctx = ast.Load
                            ),
                            ast.Str (
                                s = node.func.attr  # &lt;methodName&gt;
                            )
                        ],
                        keywords = []
                    ),
                    args = (
                        [
                            ast.Name (
                                id = 'self',
                                ctx = ast.Load
                            )
                        ] +
                        node.args                   # &lt;normal part of params&gt;
                    ),
                    keywords = node.keywords        # &lt;keyword part of params&gt;
                )
            )
            return



    # Generate call to __call__ rather than direct call, to facilitate operator overloading, if that is allowed
    if (
        self.allowOperatorOverloading and       # If operator overloading and
        not (                                   # whe're not already in the __call__ that we generated on the fly,
            type (node.func) == ast.Name and
            node.func.id == '__call__'
        )
    ):
        if type (node.func) == ast.Attribute:
            # in case of an attribute call, save the object/call? value first into an accumulator variable, then call the attribute function on it
            self.emit ('(function () {{\n')
            self.inscope (ast.FunctionDef ())
            self.indent ()

            self.emit ('var {} = ', self.nextTemp ('accu'))
            self.visit(node.func.value)
            self.emit (';\n')

            self.emit ('return ')
            self.visit(ast.Call (
                func = ast.Name(
                    id = '__call__',
                    ctx = ast.Load
                    # Don't use node.func.ctx since callable object decorators don't have a ctx, and they too use the overloading mechanism
                ),
                args = ([
                    ast.Attribute (
                        value = ast.Name (
                            id = self.getTemp ('accu'),
                            ctx = ast.Load
                        ),
                        attr = node.func.attr,
                        ctx = ast.Load
                    ),
                    ast.Name(
                        id = self.getTemp ('accu'),
                        ctx = ast.Load
                    )
                ] + node.args),
                keywords = node.keywords
             ))
            self.emit(';\n')

            self.prevTemp('accu')

            self.dedent()
            self.descope()
            self.emit('}}) ()')
        else:
            # generate __call__ node on the fly and visit it
            self.visit (ast.Call (
                func = ast.Name (
                    id = '__call__',
                    ctx = ast.Load
                ),
                args = ([
                      node.func,
                      ast.NameConstant (
                          value = None)
                ] + node.args),
                keywords = node.keywords
            ))
        return  # The newly created node was visited by a recursive call to visit_Call. This replaces the current visit.
    # We're in a parametrized dataclass decorator, switch some data class code generation options

    if dataClassArgDict != None:
        # Start out with the defaults
        dataClassArgTuple = copy.deepcopy (dataClassDefaultArgTuple)

        # Adapt positional args)
        for index, expr in enumerate (node.args):
            value = None
            if expr == ast.NameConstant:
                value = True if expr.value == 'True' else False if expr.value == 'False' else None
            if value != None:
                dataClassArgTuple [index][1] = value
            else:
                raise utils.Error (message = 'Arguments to @dataclass can only be constants True or False')

        # Adapt keyword args
        dataClassArgDict.update (dict (dataClassArgTuple))

        for keyword in node.keywords:
            dataClassArgDict [keyword.arg] = keyword.value
        return

    # If we end up here, finally we're in an ordinary function call
    self.visit (node.func)
    self.emit (' (')

    # Emit positional args
    for index, expr in enumerate (node.args):
        self.emitComma (index)

        if type (expr) == ast.Starred:
            self.emit ('...')

        self.visit (expr)

    # Emit keyword args
    if node.keywords:
        self.emitComma (len (node.args))
        emitKwargTrans ()

    self.emit (')')

</t>
<t tx="ekr.20201219054931.57">def visit_ClassDef (self, node):

    self.adaptLineNrString (node)

    ### EKR:
    ### Apparently vs code doesn't like 'export'.
    ### Instead, it wants the following at the end:
        # module.exports = {
        #   exported_symbol_1,
        #   exported_symbol_2,
        #   ...
        # }
    if type (self.getScope () .node) == ast.Module:
        self.emit ('export var {} = '.format (self.filterId (node.name)))
        self.allOwnNames.add (node.name)
    elif type (self.getScope () .node) == ast.ClassDef:
        self.emit ('\n{}:'.format (self.filterId (node.name)))
    else:
        self.emit ('var {} ='.format (self.filterId (node.name)))

    # If it's a dataclass (must currently be last decorator)
    # Remember this fact, to later insert def __init__ into parse tree
    # Pop dataclass decorator from decorator list
    isDataClass = False
    if node.decorator_list:
        &lt;&lt; parse decorators &gt;&gt;

    decoratorsUsed = 0
    if node.decorator_list:
        &lt;&lt; generator decorators &gt;&gt;

    self.emit (' __class__ (\'{}\', [', self.filterId (node.name))

    if node.bases:
        for index, expr in enumerate (node.bases):
            try:
                self.emitComma (index)
                self.visit (expr)
            except Exception as exception:
                utils.enhanceException (
                    exception,
                    lineNr = self.lineNr,
                    message = '\n\tInvalid base class'
                )
    else:
        self.emit ('object')
    self.emit ('], {{')
    self.inscope (node)

    self.indent ()
    self.emit ('\n__module__: __name__,')
    
    &lt;&lt; Define lists &gt;&gt;

    index = 0

    if isDataClass:
        initHoistFragmentIndex = self.fragmentIndex
        initHoistIndentLevel = self.indentLevel

    for statement in node.body:
        &lt;&lt; Handle one statement in node.body &gt;&gt;
    self.dedent ()

    self.emit ('\n}}')

    if node.keywords:
        if node.keywords [0] .arg == 'metaclass':
            self.emit (', ')
            self.visit (node.keywords [0] .value)
        else:
            raise utils.Error (
                lineNr = self.lineNr,
                message = '\n\tUnknown keyword argument {} definition of class {}'.format (node.keywords [0] .arg, node.name)
            )

    self.emit (')')

    # Close brackets of decorator param lists
    if decoratorsUsed:
        self.emit (')' * decoratorsUsed)

    # Emit docstring attribute assignment
    if self.allowDocAttribs:
        docString = ast.get_docstring (node)
        if docString:
           self.emit (' .__setdoc__ (\'{}\')', docString.replace ('\n', '\\n '))

    &lt;&lt; Handle class var assigns &gt;&gt;

    # Deal with delayed assigns and property assigns
    # Property assigns will be pushed onto a stack
    # They will eventually be dealt with if this class isn't directly local to another class
    for assign in delayedAssigns + propertyAssigns:
        self.emit (';\n')
        self.visit (assign)

    self.mergeList.append (utils.Any (
        className = '.'.join ([scope.node.name for scope in self.getAdjacentClassScopes ()]),
        isDataClass = isDataClass,
        reprAssigns = reprAssigns,
        compareAssigns = compareAssigns,
        initAssigns = initAssigns
    ))

    self.descope () # No earlier, class vars need it
    
    &lt;&lt; define emitters &gt;&gt;

    # Emit properties if this class isn't directly local to another class
    if type (self.getScope ().node) != ast.ClassDef:  
        emitProperties ()
        emitMerges ()
</t>
<t tx="ekr.20201219054931.58">def visit_Compare (self, node):
    if len (node.comparators) &gt; 1:
        self.emit ('(')

    left = node.left
    for index, (op, right) in enumerate (zip (node.ops, node.comparators)):
        if index:
            self.emit (' &amp;&amp; ')

        if type (op) in (ast.In, ast.NotIn) or (self.allowOperatorOverloading and type (op) in (
            ast.Eq, ast.NotEq, ast.Lt, ast.LtE, ast.Gt, ast.GtE
        )):
            self.emit ('{} ('.format (self.filterId (

                # Non-overloaded
                '__in__' if type (op) == ast.In else
                '!__in__' if type (op) == ast.NotIn else

                # Overloaded
                '__eq__' if type (op) == ast.Eq else
                '__ne__' if type (op) == ast.NotEq else
                '__lt__' if type (op) == ast.Lt else
                '__le__' if type (op) == ast.LtE else
                '__gt__' if type (op) == ast.Gt else
                '__ge__' if type (op) == ast.GtE else

                'Never here'
            )))
            self.visitSubExpr (node, left)
            self.emit (', ')
            self.visitSubExpr (node, right)
            self.emit (')')
        else:
            self.visitSubExpr (node, left)
            self.emit (' {0} '.format (self.operators [type (op)][0]))
            self.visitSubExpr (node, right)

        left = right

    if len (node.comparators) &gt; 1:
        self.emit(')')

</t>
<t tx="ekr.20201219054931.59">def visit_Continue (self, node):
    self.emit ('continue')

</t>
<t tx="ekr.20201219054931.6">def __init__ (
    self,
    moduleSearchDirs,   # All possible roots of the module path, the latter uniquely denoted by the dotted module name
    symbols,            # Set of symbols either passed on the command line, deduced from command line switches etc.
    envir               # Data about run / compilation environment
):
    utils.setProgram (self)

    self.moduleSearchDirs = moduleSearchDirs
    self.symbols = symbols
    self.envir = envir
    self.javascriptVersion = int (utils.commandArgs.esv) if utils.commandArgs.esv else 6

    self.moduleDict = {}    # Administration of all modules that play a role in this program
    self.importStack = []   # Pending imports, enables showing load sequence in case a module cannot be loaded

    # Set paths
    self.sourcePrepath = os.path.abspath (utils.commandArgs.source) .replace ('\\', '/')
    self.sourceDir = '/'.join (self.sourcePrepath.split ('/') [ : -1])
    self.mainModuleName = self.sourcePrepath.split ('/') [-1]
    self.targetDir = f'{self.sourceDir}/__target__'
    self.projectPath = f'{self.targetDir}/{self.mainModuleName}.project'

    # Load the most recent project metadata
    try:
        with open (self.projectPath, 'r') as projectFile:
            project = json.load (projectFile)
    except:
        project = {}

    # Reset everything in case of a build or a command args change
    self.optionsChanged = utils.commandArgs.projectOptions != project.get ('options')
    if utils.commandArgs.build or self.optionsChanged:
        shutil.rmtree (self.targetDir, ignore_errors = True)

    try:
        # Provide runtime module since it's always needed but never imported explicitly
        self.runtimeModuleName = 'org.transcrypt.__runtime__'
        self.searchedModulePaths = []   # Report only failure of searching runtime, so clear any history
        self.provide (self.runtimeModuleName)

        # Provide main module and, with that, all other modules recursively
        self.searchedModulePaths = []   # Report only failure of searching for main, so clear any history
        self.provide (self.mainModuleName, '__main__')
    except Exception as exception:
        utils.enhanceException (    # If it was an Error, don't change it, otherwise make it one (??? Just to be sure?)
            exception,
            message = f'\n\t{exception}'
        )

    # Finally, save the run info
    project = {
        'options': utils.commandArgs.projectOptions,
        'modules': [{'source': module.sourcePath, 'target': module.targetPath} for module in self.moduleDict.values ()],
    }
    with utils.create (self.projectPath) as projectFile:
        json.dump (project, projectFile)

</t>
<t tx="ekr.20201219054931.60">def visit_Delete (self, node):  # Currently dict element only, rest can be done with empty slice assignment
    for expr in node.targets:
        if type (expr) != ast.Name:
            self.emit ('delete ')
            self.visit (expr)
            self.emit (';\n')

</t>
<t tx="ekr.20201219054931.61">def visit_Dict (self, node):
    if not self.allowJavaScriptKeys:                    # If we don't want JavaScript treatment of keys, for literal keys it doesn't make a difference
        for key in node.keys:
            if not type (key) in (ast.Str, ast.Num):    # but if there's only one non-literal key there's a difference, and all keys are treated the Python way
                self.emit ('dict ([')
                for index, (key, value) in enumerate (zip (node.keys, node.values)):
                    self.emitComma (index)
                    self.emit ('[')
                    self.visit (key)                    # In a JavaScript list, name is evaluated as variable or function call to produce a key
                    self.emit (', ')
                    self.visit (value)
                    self.emit (']')
                self.emit ('])')
                return

    if self.allowJavaScriptIter:
        self.emit ('{{')
    else:
        self.emit ('dict ({{')                              # Since we didn't return, we want identifier keys to be treated as string literals
    for index, (key, value) in enumerate (zip (node.keys, node.values)):
        self.emitComma (index)
        self.idFiltering = False                            # The key may be a string or an identifier, the latter normally would be filtered, which we don't want
        self.visit (key)                                    # In a JavaScript object literal, an identifier isn't evaluated but literally taken to be a key.
        self.idFiltering = True
        self.emit (': ')
        self.visit (value)

    if self.allowJavaScriptIter:
        self.emit ('}}')
    else:
        self.emit ('}})')

</t>
<t tx="ekr.20201219054931.62">def visit_DictComp (self, node):
    self.visit_ListComp (node, isDict = True)

</t>
<t tx="ekr.20201219054931.63">def visit_Expr (self, node):
    self.visit (node.value)

</t>
<t tx="ekr.20201219054931.64">def visit_For (self, node):
    self.adaptLineNrString (node)

    if node.orelse and not self.allowJavaScriptIter:
        self.emit ('var {} = false;\n', self.nextTemp ('break'))
    else:
        self.skipTemp ('break')

    # Special case optimization: iterating through range with constant literal step, start and stop can be expressions
    # Starred args not allowed, since what's 'behind' the star is only known at runtime, so there's no saying wether there's a constant literal step
    optimize = (
        type (node.target) == ast.Name and  # Since 'var' is emitted, target must not yet exist, so e.g. not be element of array
        self.isCall (node.iter, 'range') and
            type (node.iter.args [0]) != ast.Starred and (
            len (node.iter.args) &lt; 3 or                         # Constant step of 1
            type (node.iter.args [2]) == ast.Num or (           # Positive constant step
                type (node.iter.args [2]) == ast.UnaryOp and    # Negative constant step
                type (node.iter.args [2] .operand) == ast.Num
            )
        )
    )

    if self.allowJavaScriptIter:
        self.emit ('for (var ')
        self.visit (node.target)
        self.emit (' in ')
        self.visit (node.iter)
        self.emit (') {{\n')
        self.indent ()
    elif optimize:
        step = (
                1
            if len (node.iter.args) &lt;= 2 else
                node.iter.args [2] .n
            if type (node.iter.args [2]) == ast.Num else
                node.iter.args [2] .operand .n
            if type (node.iter.args [2] .op) == ast.UAdd else
                -node.iter.args [2] .operand .n
        )

        self.emit ('for (var ')
        self.visit (node.target)
        self.emit (' = ')
        self.visit (node.iter.args [0] if len (node.iter.args) &gt; 1 else ast.Num (0))
        self.emit ('; ')
        self.visit (node.target)
        self.emit (' &lt; ' if step &gt; 0 else ' &gt; ')
        self.visit (node.iter.args [1] if len (node.iter.args) &gt; 1 else node.iter.args [0])
        self.emit ('; ')
        self.visit (node.target)
        if step == 1:
            self.emit ('++')
        elif step == -1:
            self.emit ('--')
        elif step &gt;= 0:
            self.emit ( ' += {}', step)
        else:
            self.emit ( ' -= {}', -step)

        self.emit (') {{\n')
        self.indent ()

    elif not self.allowOperatorOverloading:     # No overloaded __len__ c.q. __getitem__
        self.emit ('for (var ')
        self.stripTuples = True
        self.visit (node.target)
        self.stripTuples = False
        self.emit (' of ')

        if self.allowConversionToIterable:
            self.emit ('__i__ (')

        self.visit (node.iter)

        if self.allowConversionToIterable:
            self.emit (')')

        self.emit (') {{\n')
        self.indent ()

    else:
        self.emit ('var {} = ', self.nextTemp ('iterable'))
        self.visit (node.iter)
        self.emit (';\n')

        if self.allowConversionToIterable:
            self.emit ('{0} = __i__ ({0});\n', self.getTemp ('iterable'))

        self.emit ('for (var {0} = 0; {0} &lt; len ({1}); {0}++) {{\n', self.nextTemp ('index'), self.getTemp ('iterable'))
        self.indent ()

        # Create and visit Assign node on the fly to benefit from tupple assignment
        self.visit (ast.Assign (
            targets = [node.target],
            value = ast.Subscript (
                value = ast.Name (
                    id = self.getTemp ('iterable'),
                    ctx = ast.Load
                ),
                slice = ast.Index (
                    value = ast.Num (
                        n = self.getTemp ('index')
                    )
                ),
                ctx = ast.Load
            )
        ))
        self.emit (';\n')


    self.emitBody (node.body)
    self.dedent ()
    self.emit ('}}\n')

    if not (self.allowJavaScriptIter or optimize):
        if self.allowOperatorOverloading:  # Possibly overloaded __len__ c.q. __getitem__
            self.prevTemp ('index')
            self.prevTemp ('iterable')

    if node.orelse:
        self.adaptLineNrString (node.orelse, 1) # One off, since 'else' doesn't have it's own node and line nr

        self.emit ('if (!{}) {{\n', self.getTemp ('break'))
        self.prevTemp ('break')

        self.indent ()
        self.emitBody (node.orelse)
        self.dedent ()

        self.emit ('}}\n')
    else:
        self.prevTemp ('break')

</t>
<t tx="ekr.20201219054931.65">def visit_FormattedValue (self, node):
    self.visit (node.value)

</t>
<t tx="ekr.20201219054931.66">def visit_AsyncFunctionDef (self, node):
    self.visit_FunctionDef (node, anAsync = True)

</t>
<t tx="ekr.20201219054931.67">def visit_FunctionDef (self, node, anAsync = False):

    def emitScopedBody ():
        self.inscope (node)
        self.emitBody (node.body)
        self.dedent ()
        if self.getScope (ast.AsyncFunctionDef if anAsync else ast.FunctionDef) .containsYield:
            # !!! Check: yield forbidden in AsyncFunctionDef
            self.targetFragments.insert (yieldStarIndex, '*')
        self.descope ()

    def pushPropertyAccessor(functionName):
        self.propertyAccessorList.append (utils.Any (
            functionName = functionName,
            className = '.'.join ([scope.node.name for scope in self.getAdjacentClassScopes ()])
        ))

    nodeName = node.name

    # Don't generate code for the dummy pragma definition starting the extraLines in utils
    # Pragma should never be defined, except once directly in JavaScript to support __pragma__ ('&lt;all&gt;')
    # The rest of its use is only at compile time
    
    ### EKR: Why not just return?
    ### if not nodeName == '__pragma__':
    if nodeName == '__pragma__':
        return

    isGlobal = type (self.getScope () .node) == ast.Module

    isMethod = not (isGlobal or type (self.getScope () .node) in (ast.FunctionDef, ast.AsyncFunctionDef))
        # Global or function scope, so it's no method

    if isMethod:
        self.emit ('\n')
    self.adaptLineNrString (node)

    decorate = False
    isClassMethod = False
    isStaticMethod = False
    isProperty = False
    getter = '__get__'

    if node.decorator_list:
        &lt;&lt; parse decorators &gt;&gt;

    if sum ([isClassMethod, isStaticMethod, isProperty]) &gt; 1:
        raise utils.Error (
            lineNr = self.lineNr,
            message = '\n\tstaticmethod, classmethod and property decorators can\'t be mixed\n'
        )

    jsCall = self.allowJavaScriptCall and nodeName != '__init__'

    decoratorsUsed = 0
    if decorate:
        &lt;&lt; generate decorator &gt;&gt;
    else:
        if isMethod:
            if jsCall:
                self.emit ('{}: function', self.filterId (nodeName), 'async ' if anAsync else '')
            else:
                if isStaticMethod:
                    self.emit ('get {} () {{return {}function', self.filterId (nodeName), 'async ' if anAsync else '')
                else:
                    self.emit ('get {} () {{return {} (this, {}function', self.filterId (nodeName), getter, 'async ' if anAsync else '')
        elif isGlobal:
            ### EKR:
            ### Apparently vs code doesn't like 'export'.
            ### Instead, it wants the following at the end:
                # module.exports = {
                #   exported_symbol_1,
                #   exported_symbol_2,
                #   ...
                # }
            if type (node.parentNode) == ast.Module and not nodeName in self.allOwnNames:
                self.emit ('export ')
            self.emit ('var {} = {}function', self.filterId (nodeName), 'async ' if anAsync else '')
        else:
            self.emit ('var {} = {}function', self.filterId (nodeName), 'async ' if anAsync else '')

    yieldStarIndex = self.fragmentIndex

    self.emit (' ')

    skipFirstArg = jsCall and not (not isMethod or isStaticMethod or isProperty)

    if skipFirstArg:
        # Remove first argument from methods when jscall enabled
        # Exceptions:
        #   1. staticmethods - don't have "self" or "cls" as first parameter
        #   2. properties - "self" is passed from property getters, setters
        #   3. __init__ methods don't work with jscall
        firstArg = node.args.args [0].arg
        node.args.args = node.args.args [1:]

    self.visit (node.args)

    if skipFirstArg:
        # Assign first removed parameter when jscall enabled
        # Exceptions:
        #   1. classmethods - need to resolve who is the caller, class or instance
        if isClassMethod:
            self.emit ('var {} = \'__class__\' in this ? this.__class__ : this;\n', firstArg)
        else:
            self.emit ('var {} = this;\n', firstArg)

    emitScopedBody ()
    self.emit ('}}')

    if self.allowDocAttribs:
        docString = ast.get_docstring (node)
        if docString:
            self.emit (' .__setdoc__ (\'{}\')', docString.replace ('\n', '\\n '))


    if decorate:
        self.emit (')' * decoratorsUsed)

    if isMethod:
        if not jsCall:
            if isStaticMethod:
                self.emit (';}}')
            else:
                if self.allowMemoizeCalls:
                    self.emit (', \'{}\'', nodeName)
                        # Name will be used as attribute name to add bound function to instance

                self.emit (');}}')

        if nodeName == '__iter__':
            self.emit (',\n[Symbol.iterator] () {{return this.__iter__ ()}}')

        if nodeName == '__next__':
            self.emit (',\nnext: __jsUsePyNext__')
                # ??? Shouldn't this be a property, to allow bound method pointers

    if isGlobal:
        self.allOwnNames.add (nodeName)

</t>
<t tx="ekr.20201219054931.68">def visit_GeneratorExp (self, node):
    # Currently generator expressions are just iterators on lists.
    # It's important that they aren't just lists,
    # because the each for ... in ... would create a fresh iterator from it, prevening exhaustion.
    # Since a list comp is an iterator itself, just copies will be created,
    # which will exhaust together.
    self.visit_ListComp (node, isGenExp = True)

</t>
<t tx="ekr.20201219054931.69">def visit_Global (self, node):
    self.getScope (ast.FunctionDef, ast.AsyncFunctionDef) .nonlocals.update (node.names)

    # raise utils.Error (
        # lineNr = self.lineNr,
        # message = '\n\tKeyword \'global\' not supported, use \'nonlocal\' instead, or make variable attribute of \'window\'\n'
    # )

</t>
<t tx="ekr.20201219054931.7">def provide (self, moduleName, __moduleName__ = None, filter = None):
    # moduleName may contain dots if it's imported, but it'll have the same name in every import

    if moduleName in self.moduleDict:  # Find out if module is already provided
        return self.moduleDict [moduleName]
    else:                              # If not, provide by loading or compiling
        # This may fail legally if filteredModuleName ends on a name of something in a module, rather than of the module itself
        return Module (self, moduleName, __moduleName__, filter)

</t>
<t tx="ekr.20201219054931.70">def visit_If (self, node):
    self.adaptLineNrString (node)

    self.emit ('if (')
    self.emitBeginTruthy ()
    global inIf
    inIf = True
    self.visit (node.test)
    inIf = False
    self.emitEndTruthy ()
    self.emit (') {{\n')

    self.indent ()
    self.emitBody (node.body)
    self.dedent ()

    self.emit ('}}\n')

    if node.orelse:
        if len (node.orelse) == 1 and node.orelse [0].__class__.__name__ == 'If':
            # elif statement, we stay on the same line, no need to call adaptLineNrString
            self.emit ('else ')
            self.visit (node.orelse [0])
        else:
            self.adaptLineNrString (node.orelse, 1) # One off, since 'else' doesn't have it's own node and line nr

            self.emit ('else {{\n')
            self.indent ()
            self.emitBody (node.orelse)
            self.dedent ()
            self.emit ('}}\n')

</t>
<t tx="ekr.20201219054931.71">def visit_IfExp (self, node):
    self.emit ('(')
    self.emitBeginTruthy ()
    self.visit (node.test)
    self.emitEndTruthy ()
    self.emit (' ? ')
    self.visit (node.body)
    self.emit (' : ')
    self.visit (node.orelse)
    self.emit (')')

</t>
<t tx="ekr.20201219054931.72">def visit_Import (self, node):
    # Since clashes with own names have to be avoided, the node is stored to revisit it after the own names are known
    self.importHoistMemos.append (utils.Any (node = node, lineNr = self.lineNr))

</t>
<t tx="ekr.20201219054931.73">def revisit_Import (self, importHoistMemo):     # Import ... can only import modules
    self.lineNr = importHoistMemo.lineNr
        # This is the lineNr from the original visit, which may be obtained from the node at that time or "cached" earlier
    node = importHoistMemo.node
    self.adaptLineNrString (node)
        # If it isn't (again) obtained from the node, the memoed version will be used

    names = [alias for alias in node.names if not alias.name.startswith (self.stubsName)]

    if not names:
        return

    '''
    Possibilities:

    (1) import a.b.d, d.e.f as g        --&gt; import
    '''

    for index, alias in enumerate (names):
        try:
            module = self.useModule (alias.name)
        except Exception as exception:
            utils.enhanceException (
                exception,
                lineNr = self.lineNr,
                message = '\n\tCan\'t import module \'{}\''.format (alias.name)
            )

        if alias.asname and not alias.asname in (self.allOwnNames | self.allImportedNames):
            # Import 'as' a non-dotted name, so no need to nest
            # Clashes with own names or already imported names are avoided

            self.allImportedNames.add (alias.asname)
            self.emit ('import * as {} from \'{}\';\n', self.filterId (alias.asname), module.importRelPath)
        else:
            # Import dotted name, requires import under constructed unique name and then nesting,
            # including transfer of imported names from immutable module to mutable object
            # This mutable module representation object may come to hold other mutable module represention objects

            self.emit ('import * as __module_{}__ from \'{}\';\n', self.filterId (module.name) .replace ('.', '_'), module.importRelPath)
            aliasSplit = alias.name.split ('.', 1)
            head = aliasSplit [0]
            tail = aliasSplit [1] if len (aliasSplit) &gt; 1 else ''

            self.importHeads.add (head)
            self.emit ('__nest__ ({}, \'{}\', __module_{}__);\n', self.filterId (head), self.filterId (tail), self.filterId (module.name .replace ('.', '_')))

        if index &lt; len (names) - 1:
            self.emit (';\n')

</t>
<t tx="ekr.20201219054931.74">def visit_ImportFrom (self, node):
    # Just as with visit_Import, postpone imports until own names are known, to prevent clashes
    self.importHoistMemos.append (utils.Any (node = node, lineNr = self.lineNr))

</t>
<t tx="ekr.20201219054931.75">def revisit_ImportFrom (self, importHoistMemo): # From ... import ... can import modules or facitities offered by modules
    self.lineNr = importHoistMemo.lineNr        # This is the lineNr from the original visit, which may be obtained from the node at that time or "cached" earlier
    node = importHoistMemo.node
    self.adaptLineNrString (node)               # If it isn't (again) obtained from the node, the memoed version will be used

    if node.module.startswith (self.stubsName):
        return

    '''
    Possibilities with modules a, b, c and (non-module) facilities: p, q, r, s:

    (1) from a.b.c import *                             --&gt; import {p, q, r, s} from 'a.b.c.'               Use facilities, generate afterward

    (2) from a.b.c import p as P, q, r as R, s          --&gt; import {p as P, q, r as R, s} from 'a.b.c.'     Use facilities, generate afterward

    (3) from a.b import c0, c1 as C1, c2, c3 as C3      --&gt; import * as c0 from 'a.b.c0'                    Don't use facilities, generate directly
                                                            import * as C1 from 'a.b.c1'
                                                            import * as c2 from 'a.b.c2'
                                                            import * as C3 from 'a.b.C3'

    (1) can happen only in isolation, (2) and (3) can be combined in one Python import statement
    '''

    try:
        # Import modules or facilities offered by them
        self.module.program.searchedModulePaths = []                                    # If none of the possibilities below succeeds, report all searched paths
        namePairs = []
        facilityImported = False
        for index, alias in enumerate (node.names):
            if alias.name == '*':                                                       # * Never refers to modules, only to facilities in modules
                if len (node.names) &gt; 1:
                    raise utils.Error (
                        lineNr = self.lineNr,
                        message = '\n\tCan\'t import module \'{}\''.format (alias.name)
                    )
                module = self.useModule (node.module)
                for aName in module.exportedNames:
                    namePairs.append (utils.Any (name = aName, asName = None))
            else:
                try:                                                                    # Try if alias denotes a module, in that case don't do the 'if namepairs' part
                    module = self.useModule ('{}.{}'.format (node.module, alias.name))  # So, attempt to use alias as a module
                    self.emit ('import * as {} from \'{}\';\n', self.filterId (alias.asname) if alias.asname else self.filterId (alias.name), module.importRelPath) # Modules too can have asName
                    self.allImportedNames.add (alias.asname or alias.name)              # Add import to allImportedNames of this module
                except:                                                                 # It's a facility rather than a module
                    module = self.useModule (node.module)
                    namePairs.append (utils.Any (name = alias.name, asName = alias.asname))
                    facilityImported = True

        if facilityImported:                                                        # At least one alias denoted a facility rather than a module
            module = self.useModule (node.module)                                   # Use module that contains it
            namePairs.append (utils.Any (name = alias.name, asName = alias.asname))

        # This part should only be done for facilities inside modules, and indeed they are the only ones adding namePairs
        if namePairs:
            try:
                # Still, when here, the 'decimated' import list become empty in rare cases, but JavaScript should swallow that
                self.emit ('import {{')
                for index, namePair in enumerate (sorted (namePairs, key = lambda namePair: namePair.asName if namePair.asName else namePair.name)):
                    if not (namePair.asName if namePair.asName else namePair.name) in (self.allOwnNames | self.allImportedNames):
                        self.emitComma (index)
                        self.emit (self.filterId (namePair.name))
                        if namePair.asName:
                            self.emit (' as {}', self.filterId (namePair.asName))
                            self.allImportedNames.add (namePair.asName)
                        else:
                            self.allImportedNames.add (namePair.name)
                self.emit ('}} from \'{}\';\n', module.importRelPath)
            except:
                print ('Unexpected import error:', traceback.format_exc ())  # Should never be here

    except Exception as exception:
        utils.enhanceException (
            exception,
            lineNr = self.lineNr,
            message = '\n\tCan\'t import from module \'{}\''.format (node.module)
        )

</t>
<t tx="ekr.20201219054931.76">def visit_JoinedStr (self, node):
    self.emit (repr (''.join ([value.s if type (value) == ast.Str else '{{}}' for value in node.values])))
    self.emit ('.format (')
    index = 0
    for value in node.values:
        if type (value) == ast.FormattedValue:
            self.emitComma (index)
            self.visit (value)
            index += 1
    self.emit (')')

</t>
<t tx="ekr.20201219054931.77">def visit_Lambda (self, node):
    self.emit ('(function __lambda__ ',)    # Extra () needed to make it callable at definition time
    self.visit (node.args)
    self.emit ('return ')
    self.visit (node.body)
    self.dedent ()
    self.emit (';\n}})')

</t>
<t tx="ekr.20201219054931.78">def visit_List (self, node):
    self.emit ('[')
    for index, elt in enumerate (node.elts):
        self.emitComma (index)
        self.visit (elt)
    self.emit (']')

</t>
<t tx="ekr.20201219054931.79">def visit_ListComp (self, node, isSet = False, isDict = False, isGenExp = False):
    elts = []
    bodies = [[]]

    # Create and visit For node on the fly to benefit from tuple assignment
    # The For node creates an Assign node on the fly, to get this done
    def nestLoops (generators):
        for comprehension in generators:
            target = comprehension.target
            iter = comprehension.iter

            # Make room for body of this for
            bodies.append ([])
            # Append this for to previous body
            bodies [-2].append (ast.For (target, iter, bodies [-1], []))

            for expr in comprehension.ifs:
                test = expr

                # Make room for body of this if
                bodies.append ([])
                # Append this if to previous body
                bodies [-2].append (ast.If (
                    test = test,
                    body = bodies [-1],
                    orelse = []
                ))

        bodies [-1].append (
            # Nodes to generate __accu&lt;i&gt;__.append (&lt;elt&gt;)
            ast.Call (
                func = ast.Attribute (
                    value = ast.Name (
                        id = self.getTemp ('accu'),
                        ctx = ast.Load),
                    attr = 'append',
                    ctx = ast.Load
                ),
                args = [
                        ast.List (
                            elts = [node.key, node.value],
                            ctx = ast.Load
                        )
                    if isDict else
                        node.elt
                ],
                keywords = []
            )
        )

        self.visit (
            bodies [0][0]
        )

    self.emit ('(function () {{\n')
    self.inscope (ast.FunctionDef ())
    self.indent ()
    self.emit ('var {} = [];\n', self.nextTemp ('accu'))
    nestLoops (node.generators [:]) # Leave original in intact, just for neatness
    self.emit (
        'return {}{}{};\n',
        'set (' if isSet else 'dict (' if isDict else '{} ('.format (self.filterId ('iter')) if isGenExp else '' ,
        self.getTemp ('accu'),
        ')' if isSet or isDict or isGenExp else ''
    )
    self.prevTemp ('accu')
    self.dedent ()
    self.descope ()
    self.emit ('}}) ()')

</t>
<t tx="ekr.20201219054931.8">class Module:
    @others
</t>
<t tx="ekr.20201219054931.80">def visit_Module (self, node):
    # Adapt self.lineNrString to whatever self.lineNr happens to be
    self.adaptLineNrString ()

    # Emit module collophon comment
    self.emit ('// {}\'ed from Python, {}\n',
        self.module.program.envir.transpiler_name.capitalize (), datetime.datetime.now ().strftime ('%Y-%m-%d %H:%M:%S'),
    )

    # Adapt self.lineNrString to the line number that the node stems from
    self.adaptLineNrString (node)

    # Enter module scope
    self.inscope (node)

    # Remember where hoists have to be inserted in the fragments list
    self.importHoistFragmentIndex = self.fragmentIndex

    # Let the module know its __name__
    self.emit ('var __name__ = \'{}\';\n', self.module.__name__)    # ??? Needs filterId ?
    self.allOwnNames.add ('__name__')

    # Generate code for the module body
    for statement in node.body:
        if self.isCommentString (statement):
            pass
        else:
            self.visit (statement)
            self.emit (';\n')

    # Store docstring if allowed, can only be done 'late'
    # since __pragma__ ('docat') or __pragma__ ('nodocat') should precede it
    if self.allowDocAttribs:
        docString = ast.get_docstring (node)
        if docString:
            self.allOwnNames.add ('__doc__')    # Should be done before generation of exported names

    # Prepair to generate hoisted fragments near start of fragments
    self.fragmentIndex = self.importHoistFragmentIndex    # Subsequent emits will also hoist self.lineNr, subsequent revisits will even adapt self.lineNrString

    # Insert docstring at hoist location, further hoists are PRE(!)pended
    if self.allowDocAttribs and docString:
        self.emit ('export var __doc__ = \'{}\';\n', docString.replace ('\n', '\\n'))

    '''
    Make the globals () function work as well as possible in conjunction with JavaScript 6 modules rather than closures

    JavaScript 6 module-level variables normally cannot be accessed directly by their name as a string
    They aren't attributes of any global object, certainly not in strict mode, which is the default for modules
    By making getters and setters by the same name members of __all__, we can approach globals () as a dictionary

    Limitations:
    - We can access (read/write) but not create module-level globals this way
    - If there are a lot of globals (bad style) this mechanism becomes expensive, so it must be under a pragma

    It's possible that future versions of JavaScript facilitate better solutions to this minor problem
    '''
    if self.allowGlobals:
        self.emit (
            'var __all__ = dict ({{'
                # Has nothing to do with emitting an export list,
                # just another importable (so exported) module level variable __all__
            +
            ', '.join ([
                f'get {name} () {{{{return {name};}}}}, set {name} (value) {{{{{name} = value;}}}}'
                    for name in sorted (self.allOwnNames)
            ])
            +
            '}});\n'
        )   # ??? Needs filterid?

    # Import other modules (generatable only late, but hoisted) and nest them into the import heads
    # The import head definitions are generated later but inserted before the imports
    self.fragmentIndex = self.importHoistFragmentIndex
    for importHoistMemo in reversed (self.importHoistMemos):
        if type (importHoistMemo.node) == ast.Import:
            self.revisit_Import (importHoistMemo)
        else:
            self.revisit_ImportFrom (importHoistMemo)

    # Transit export of imported facilities (so no facilities that weren't imported and no modules)
    if utils.commandArgs.xreex or self.module.sourcePrename == '__init__':
        if self.allImportedNames:
            self.emit ('export {{{}}};\n', ', '.join ([self.filterId (importedName) for importedName in self.allImportedNames]))     # This emits an export list

    # Import runtime module (generatable only late, but hoisted)
    # Place it first, but decimate its imported names last, since they should appear to be overriden by later imports
    self.fragmentIndex = self.importHoistFragmentIndex
    if self.module.name != self.module.program.runtimeModuleName:
        runtimeModule = self.module.program.moduleDict [self.module.program.runtimeModuleName]

        # Avoid double declarations since imports are immutable (hoisted)
        importedNamesFromRuntime = ', '.join (sorted ([
            exportedNameFromRuntime
            for exportedNameFromRuntime in runtimeModule.exportedNames
            if not exportedNameFromRuntime in (self.allOwnNames | self.allImportedNames)
        ]))

        self.emit ('import {{{}}} from \'{}\';\n', importedNamesFromRuntime, runtimeModule.importRelPath)

    # Emit empty import head objects, each as the leftmost part of the dotted name that can be used to access the imported module
    # Note that the required importheads are only known after importing modules, but must be inserted in the target code before that,
    # since they must be filled by the imports
    # Place definition of import heads before actual import that includes nesting, even though they are known only after the imports
    self.fragmentIndex = self.importHoistFragmentIndex
    for importHead in sorted (self.importHeads):
        self.emit ('var {} = {{}};\n', self.filterId (importHead))

    # Exit module scope
    self.descope ()

</t>
<t tx="ekr.20201219054931.81">def visit_Name (self, node):
    if node.id == '__file__':
        self.visit (ast.Str (s = self.module.sourcePath))
        return

    elif node.id == '__filename__':
        path = os.path.split (self.module.sourcePath)
        fileName = path [1]

        if fileName.startswith ('__init__'):
            subDir = os.path.split (path [0])
            fileName = os.path.join (subDir [1], fileName)

        self.visit (ast.Str (s = fileName))
        return

    elif node.id == '__line__':
        self.visit (ast.Num (n = self.lineNr))
        return

    elif type (node.ctx) == ast.Store:
        if type (self.getScope () .node) == ast.Module:
            self.allOwnNames.add (node.id)

    self.emit (self.filterId (node.id))

</t>
<t tx="ekr.20201219054931.82">def visit_NameConstant (self, node):
    self.emit (self.nameConsts [node.value])

</t>
<t tx="ekr.20201219054931.83">def visit_Nonlocal (self, node):
    self.getScope (ast.FunctionDef, ast.AsyncFunctionDef) .nonlocals.update (node.names)

</t>
<t tx="ekr.20201219054931.84">def visit_Num (self, node):
    self.emit ('complex (0, {})'.format (node.n.imag) if type (node.n) == complex else '{}'.format (node.n))

</t>
<t tx="ekr.20201219054931.85">def visit_Pass (self, node):
    self.adaptLineNrString (node)

    self.emit ('// pass')

</t>
<t tx="ekr.20201219054931.86">def visit_Raise (self, node):
    self.adaptLineNrString (node)

    if node.exc:
        # Create an exception object with a temporary name
        self.emit ('var {} = ', self.nextTemp ('except'))
        self.visit (node.exc)
        self.emit (';\n')
    else:
        # We want to rethrow, so we must be in a catch block, so the 'current exception' with name self.getTemp ('except') will exist already
        pass

    # Optionally add a __cause__ attribute to it
    self.emit ('{}.__cause__ = ', self.getTemp ('except'))
    if node.cause:
        self.visit (node.cause)
    else:
        self.emit ('null')

    self.emit (';\n')

    # Throw the exception
    self.emit ('throw {}', self.getTemp ('except'))

    # Relinquish the temporary name if we own it
    if node.exc:
        self.prevTemp ('except')

</t>
<t tx="ekr.20201219054931.87">def visit_Return (self, node):
    self.adaptLineNrString (node)

    self.emit ('return ')
    if node.value:
        self.visit (node.value)

</t>
<t tx="ekr.20201219054931.88">def visit_Set (self, node):
    self.emit ('new set ([')
    for index, elt in enumerate (node.elts):
        self.emitComma (index)
        self.visit (elt)
    self.emit ('])')

</t>
<t tx="ekr.20201219054931.89">def visit_SetComp (self, node):
    self.visit_ListComp (node, isSet = True)

</t>
<t tx="ekr.20201219054931.9">def __init__ (self, program, name, __name__, filter):
    self.program = program
    self.name = name
    self.__name__ = __name__ if __name__ else self.name

    # Try to find module, exception if fails
    self.findPaths (filter)

    # Remember names of module being under compilation and line nrs of current import
    # Used for error reports
    # Note that JavaScript-only modules will leave lineNr None if they import something
    # This is since there's no explicit import location in such modules
    # Only add a module to the importStack if it's at least found by findPaths, otherwise it has no sourcePath to report
    self.program.importStack.append ([self, None])

    # Register that module is found
    self.program.moduleDict [self.name] = self

    # Create sourcemapper, if only for cleaning dir after previous run
    self.sourceMapper = sourcemaps.SourceMapper (
        self.name,
        self.program.targetDir,
        not utils.commandArgs.nomin,
        utils.commandArgs.dmap
    )

    # Generate, copy or load target code and symbols
    if (
        utils.commandArgs.build or self.program.optionsChanged
        or
        not os.path.isfile (self.targetPath) or os.path.getmtime (self.sourcePath) &gt; os.path.getmtime (self.targetPath)
    ):
        # If it's a build rather than a make, or the target doesn't exist or the target is obsolete

        if self.isJavascriptOnly:
            # Digest source JavaScript and copy to target location
            self.loadJavascript ()

            # JavaScript-only, so annotations are pointless, so it's ok to strip
            javascriptDigest = utils.digestJavascript (self.targetCode, self.program.symbols, not utils.commandArgs.dnostrip, False)

        else:
            # Perform static typecheck on source code
            if utils.commandArgs.dstat:
                try:
                    type_check.run (self.sourcePath)
                except Exception as exception:
                    utils.log (True, 'Validating: {} and dependencies\n\tInternal error in static typing validator\n', self.sourcePath)

            # Construct parse tree
            self.parse ()
            if utils.commandArgs.dtree:
                self.dumpTree ()

            # Perform lightweight static check on parse tree
            if utils.commandArgs.dcheck:
                try:
                    static_check.run (self.sourcePath, self.parseTree)
                except Exception as exception:
                    utils.log (True, 'Checking: {}\n\tInternal error in lightweight consistency checker, remainder of module skipped\n', self.sourcePath)

            # Generate JavaScript code and sourcemap from parse tree
            self.generateJavascriptAndPrettyMap ()

            # Generated code, so no comments to strip, may have annotations so don't strip. There won't be any strip pragma's anyhow.
            javascriptDigest = utils.digestJavascript (self.targetCode, self.program.symbols, False, self.generator.allowDebugMap)

        # Write target code
        utils.log (True, 'Saving target code in: {}\n', self.targetPath)
        filePath = self.targetPath if utils.commandArgs.nomin else self.prettyTargetPath
        with utils.create (filePath) as aFile:
            aFile.write (self.targetCode)

        # Minify target code
        if not utils.commandArgs.nomin:
            utils.log (True, 'Saving minified target code in: {}\n', self.targetPath)
            minify.run (
                self.program.targetDir,
                self.prettyTargetName,
                self.targetName,
                mapFileName = self.shrinkMapName if utils.commandArgs.map else None,
            )

            if utils.commandArgs.map:
                if self.isJavascriptOnly:
                    if os.path.isfile (self.mapPath):
                        os.remove (self.mapPath)
                    os.rename (self.shrinkMapPath, self.mapPath)
                else:
                    self.sourceMapper.generateMultilevelMap ()

        # Append map reference to target file, which may be minified or not
        with open (self.targetPath, 'a') as targetFile:
            targetFile.write (self.mapRef)

    else:
        # If it's a make an rather than a build and the target exists, load it, beautify it if needed and run through digestJavascript for obtaining symbols
        self.targetCode = open (self.targetPath, 'r') .read ()
        javascriptDigest = utils.digestJavascript (self.targetCode, self.program.symbols, True, False, refuseIfAppearsMinified = True)

        if not javascriptDigest:
            minify.run (
                self.program.targetDir,
                self.targetName,
                self.prettyTargetName,
                prettify = True,
            )
            self.prettyTargetCode = open (self.prettyTargetPath, 'r') .read ()
            javascriptDigest = utils.digestJavascript (self.prettyTargetCode, self.program.symbols, True, False)    # Prettified, so doesn't start with '/'!

    self.targetCode = javascriptDigest.digestedCode
    self.importedModuleNames = javascriptDigest.importedModuleNames
    self.exportedNames = javascriptDigest.exportedNames

    for importedModuleName in self.importedModuleNames:

        # Unfiltered hyphens allowed, since we may be in a JavaScript-only part of the module hierarchy
        # Also these imports cannot legally fail, since the digested JavaScript code already has unambiguous imports
        # If the JavaScript module was just generated from a Python module, it will already be in the module dictionary
        self.program.searchedModulePaths = []
        self.program.provide (importedModuleName)

    # Remove eventual intermediate files
    utils.tryRemove (self.prettyTargetPath)
    utils.tryRemove (self.shrinkMapPath)
    utils.tryRemove (self.prettyMapPath)

    # Module not under compilation anymore, so pop it
    self.program.importStack.pop ()

</t>
<t tx="ekr.20201219054931.90">def visit_Slice (self, node):   # Only visited for dims as part of ExtSlice
    self.emit ('tuple ([')

    if node.lower == None:
        self.emit ('0')
    else:
        self.visit (node.lower)

    self.emit (', ')

    if node.upper == None:
        self.emit ('null')
    else:
        self.visit (node.upper)

    self.emit (', ')

    if node.step == None:
        self.emit ('1')
    else:
        self.visit (node.step)

    self.emit ('])')

</t>
<t tx="ekr.20201219054931.91">def visit_Str (self, node):
    self.emit ('{}', repr (node.s)) # Use repr (node.s) as second, rather than first parameter, since node.s may contain {}

# Visited for RHS index, non-overloaded LHS index, RHS slice and RHS extended slice
# LHS slice and overloaded LHS index are dealt with directy in visit_Assign, since the RHS is needed for them also
</t>
<t tx="ekr.20201219054931.92">def visit_Subscript (self, node):
    if type (node.slice) == ast.Index:
        if type (node.slice.value) == ast.Tuple:    # Always overloaded, it must be an RHS index
            self.visit (node.value)
            self.emit ('.__getitem__ (')
            self.stripTuple = True
            self.visit (node.slice.value)
            self.emit (')')
        elif self.allowOperatorOverloading:         # It must be an RHS index
            self.emit ('__getitem__ (')             # Free function tries .__getitem__ (overload) and [] (native)
            self.visit (node.value)
            self.emit (', ')
            self.visit (node.slice.value)
            self.emit (')')
        else:                                       # It may be an LHS or RHS index
            try:
                isRhsIndex = not self.expectingNonOverloadedLhsIndex
                self.expectingNonOverloadedLhsIndex = False
                if isRhsIndex and self.allowKeyCheck:
                    self.emit ('__k__ (')
                    self.visit (node.value)
                    self.emit (', ')
                    self.visit (node.slice.value)
                    self.emit (')')
                else:
                    self.visit (node.value)
                    self.emit (' [')
                    self.visit (node.slice.value)
                    self.emit (']')
            except:
                print (traceback.format_exc ())
    elif type (node.slice) == ast.Slice:
        if self.allowOperatorOverloading:
            self.emit ('__getslice__ (')            # Free function, tries .__getitem__ (overload) and .__getslice__ (native)
            self.visit (node.value)
            self.emit (', ')
        else:
            self.visit (node.value)
            self.emit ('.__getslice__ (')

        if node.slice.lower == None:
            self.emit ('0')
        else:
            self.visit (node.slice.lower)
        self.emit (', ')

        if node.slice.upper == None:
            self.emit ('null')
        else:
            self.visit (node.slice.upper)
        self.emit (', ')

        if node.slice.step == None:
            self.emit ('1')
        else:
            self.visit (node.slice.step)

        self.emit (')')
    elif type (node.slice) == ast.ExtSlice:         # Always overloaded
        self.visit (node.value)
        self.emit ('.__getitem__ (')                # Method, since extended slice access is always overloaded
        self.emit ('[')
        for index, dim in enumerate (node.slice.dims):
            self.emitComma (index)
            self.visit (dim)
        self.emit (']')
        self.emit (')')

</t>
<t tx="ekr.20201219054931.93">def visit_Try (self, node):
    self.adaptLineNrString (node)

    self.emit ('try {{\n')
    self.indent ()
    self.emitBody (node.body)

    if node.orelse:
        self.emit ('try {{\n')
        self.indent ()
        self.emitBody (node.orelse)
        self.dedent ()
        self.emit ('}}\n')
        self.emit ('catch ({}) {{\n', self.nextTemp ('except'))
        self.emit ('}}\n')
        self.prevTemp ('except')

    self.dedent ()
    self.emit ('}}\n')

    if node.handlers:                           # try ... finally (without any catch) is also valid Python
        self.emit ('catch ({}) {{\n', self.nextTemp ('except'))
        self.indent ()

        for index, exceptionHandler in enumerate (node.handlers):
            if index:
                self.emit ('else ')             # Never here after a catch all

            if exceptionHandler.type:
                self.emit ('if (isinstance ({}, ', self.getTemp ('except'))
                self.visit (exceptionHandler.type)
                self.emit (')) {{\n')
                self.indent ()

                if exceptionHandler.name:
                    self.emit ('var {} = {};\n', exceptionHandler.name, self.getTemp ('except'))

                self.emitBody (exceptionHandler.body)

                self.dedent ()
                self.emit ('}}\n')
            else:                               # Catch all, swallowing no problem
                self.emitBody (exceptionHandler.body)
                break
        else:                                   # No catch all, avoid swallowing exception
            self.emit ('else {{\n')
            self.indent ()
            self.emit ('throw {};\n', self.getTemp ('except'))
            self.dedent ()
            self.emit ('}}\n')

        self.dedent ()
        self.prevTemp ('except')
        self.emit ('}}\n')

    if node.finalbody:
        self.emit ('finally {{\n')
        self.indent ()
        self.emitBody (node.finalbody)
        self.dedent ()
        self.emit ('}}\n')

</t>
<t tx="ekr.20201219054931.94">def visit_Tuple (self, node):
    keepTuple = not (self.stripTuple or self.stripTuples)       # Tuples used as indices are stripped for speed
    self.stripTuple = False             # Tuples used as indices are stripped for speed, only strip first tuple encountered
                                        # Tuples used as assignment target in a JavaScript 6 for-loop are stripped for correctness, not only first
    if keepTuple:
        self.emit ('tuple (')

    self.emit ('[')
    for index, elt in enumerate (node.elts):
        self.emitComma (index)
        self.visit (elt)

    self.emit (']')

    if keepTuple:
        self.emit (')')

</t>
<t tx="ekr.20201219054931.95">def visit_UnaryOp (self, node):
    if self.allowOperatorOverloading and type (node.op) == ast.USub:
        self.emit ('{} ('.format (self.filterId ('__neg__' )))
        self.visit (node.operand)
        self.emit (')')
    else:
        self.emit (self.operators [type (node.op)][0])
        self.emitBeginTruthy ()
        self.visitSubExpr (node, node.operand)
        self.emitEndTruthy ()

</t>
<t tx="ekr.20201219054931.96">def visit_While (self, node):
    self.adaptLineNrString (node)

    if node.orelse:
        self.emit ('var {} = false;\n', self.nextTemp ('break'))
    else:
        self.skipTemp ('break')

    self.emit ('while (')
    self.emitBeginTruthy ()
    self.visit (node.test)
    self.emitEndTruthy ()
    self.emit (') {{\n')

    self.indent ()
    self.emitBody (node.body)
    self.dedent ()

    self.emit ('}}\n')

    if node.orelse:
        self.adaptLineNrString (node.orelse, 1) # One off, since 'else' doesn't have it's own node and line nr

        self.emit ('if (!{}) {{\n', self.getTemp ('break'))
        self.prevTemp ('break')

        self.indent ()
        self.emitBody (node.orelse)
        self.dedent ()

        self.emit ('}}\n')
    else:
        self.prevTemp ('break')

</t>
<t tx="ekr.20201219054931.97">def visit_With (self, node):
    self.adaptLineNrString (node)

    for item in node.items:
        self.emit ('var ')                      # Should be in surrounding scope but may be overwritten, so use var rather than let
        if (item.optional_vars):
            self.visit (item.optional_vars)
            withId = item.optional_vars.id
        else:
            withId = self.nextTemp ('withid')
            self.emit (withId)

        self.emit (' = ')
        self.visit (item.context_expr)
        self.emit (';\n')

        self.emit ('try {{\n')
        self.indent ()
        self.emit ('{}.__enter__ ();\n', withId)
        self.emitBody (node.body)
        self.emit ('{}.__exit__ ();\n', withId)
        self.dedent ()
        self.emit ('}}\n')
        self.emit ('catch ({}) {{\n', self.nextTemp ('except'))
        self.indent ()
        self.emit ('if (! ({0}.__exit__ ({1}.name, {1}, {1}.stack))) {{\n', withId, self.getTemp ('except'))
        self.indent ()
        self.emit ('throw {};\n', self.getTemp ('except'))
        self.dedent ()
        self.emit ('}}\n')
        self.dedent ()
        self.emit ('}}\n')
        self.prevTemp ('except')

        if withId == self.getTemp ('withid'):
            self.prevTemp ('withid')

</t>
<t tx="ekr.20201219054931.98">def visit_Yield (self, node):
    self.getScope (ast.FunctionDef, ast.AsyncFunctionDef) .containsYield = True
    self.emit ('yield')
    if (node.value != None):
        self.emit (' ')
        self.visit (node.value)

</t>
<t tx="ekr.20201219054931.99">def visit_YieldFrom (self, node):
    self.getScope (ast.FunctionDef, ast.AsyncFunctionDef) .containsYield = True
    self.emit ('yield* ')
    self.visit (node.value)
</t>
<t tx="ekr.20201219055031.1"># ====== Legal notices
#
#
# Copyright 2014 - 2018 Jacques de Hooge, GEATEC engineering, www.geatec.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.</t>
<t tx="ekr.20201219061022.1">// Needed for __base__ and __standard__ if global 'opov' switch is on
export function __call__ (/* &lt;callee&gt;, &lt;this&gt;, &lt;params&gt;* */) {
    var args = [] .slice.apply (arguments);
    if (typeof args [0] == 'object' &amp;&amp; '__call__' in args [0]) {        // Overloaded
        return args [0] .__call__ .apply (args [1], args.slice (2));
    }
    else {                                                              // Native
        return args [0] .apply (args [1], args.slice (2));
    }
};
</t>
<t tx="ekr.20201219061022.2">// Complete __envir__, that was created in __base__, for non-stub mode
__envir__.executor_name = __envir__.transpiler_name;

// Make make __main__ available in browser
var __main__ = {__file__: ''};

// Define current exception, there's at most one exception in the air at any time
var __except__ = null;

 // Creator of a marked dictionary, used to pass **kwargs parameter
export function __kwargtrans__ (anObject) {
    anObject.__kwargtrans__ = null; // Removable marker
    anObject.constructor = Object;
    return anObject;
}</t>
<t tx="ekr.20201219061022.3">// Partial implementation of super () .&lt;methodName&gt; (&lt;params&gt;)
export function __super__ (aClass, methodName) {
    // Lean and fast, no C3 linearization, only call first implementation encountered
    // Will allow __super__ ('&lt;methodName&gt;') (self, &lt;params&gt;) rather than only &lt;className&gt;.&lt;methodName&gt; (self, &lt;params&gt;)
    for (let base of aClass.__bases__) {
        if (methodName in base) {
           return base [methodName];
        }
    }

    throw new Exception ('Superclass method not found');    // !!! Improve!
}
</t>
<t tx="ekr.20201219061023.1">// Python property installer function, no member since that would bloat classes
export function property (getter, setter) {
    // Returns a property descriptor rather than a property
    if (!setter) {  // ??? Make setter optional instead of dummy?
        setter = function () {};
    }
    return {get: function () {return getter (this)}, set: function (value) {setter (this, value)}, enumerable: true};
}
</t>
<t tx="ekr.20201219061023.2">// Conditional JavaScript property installer function,
// prevents redefinition of properties if multiple Transcrypt apps are on one page
export function __setproperty__ (anObject, name, descriptor) {
    if (!anObject.hasOwnProperty (name)) {
        Object.defineProperty (anObject, name, descriptor);
    }
}
</t>
<t tx="ekr.20201219061023.3">// Assert function, call to it only generated when compiling with --dassert option
export function assert (condition, message) {  // Message may be undefined
    if (!condition) {
        throw AssertionError (message, new Error ());
    }
}

</t>
<t tx="ekr.20201219061309.1">// Merge function for keyword transfer objects
export function __mergekwargtrans__ (object0, object1) {
    var result = {};
    for (var attrib in object0) {
        result [attrib] = object0 [attrib];
    }
    for (var attrib in object1) {
        result [attrib] = object1 [attrib];
    }
    return result;
};

</t>
<t tx="ekr.20201219061309.2">// Merge function for dataclass fields
export function __mergefields__ (targetClass, sourceClass) {
    let fieldNames = ['__reprfields__', '__comparefields__', '__initfields__']
    if (sourceClass [fieldNames [0]]) {
        if (targetClass [fieldNames [0]]) {
            for (let fieldName of fieldNames) {
                targetClass [fieldName] = new Set ([...targetClass [fieldName], ...sourceClass [fieldName]]);
            }
        }
        else {
            for (let fieldName of fieldNames) {
                targetClass [fieldName] = new Set (sourceClass [fieldName]);
            }
        }
    }
}

</t>
<t tx="ekr.20201219061310.1">// Context manager support

export function __withblock__ (manager, statements) {
    if (hasattr (manager, '__enter__')) {
        try {
            manager.__enter__ ();
            statements ();
            manager.__exit__ ();
        }
        catch (exception) {
            // Same signature as CPython : type, value, traceback
            if (! (manager.__exit__ (exception.name, exception, exception.stack))) {
                throw exception;
            }
        }
    }
    else {  // Close an open file object, even if it doesn't support context management
        statements ();
        manager.close ();
    }
};  

</t>
<t tx="ekr.20201219061310.2">// Manipulating attributes by name

export function dir (obj) {
    var aList = [];
    for (var aKey in obj) {
        aList.push (aKey.startsWith ('py_') ? aKey.slice (3) : aKey);
    }
    aList.sort ();
    return aList;
};
</t>
<t tx="ekr.20201219061310.3">export function setattr (obj, name, value) {
    obj [name] = value; // Will not work in combination with static retrieval of aliased attributes, too expensive
};

export function getattr (obj, name) {
    return name in obj ? obj [name] : obj ['py_' + name];
};

export function hasattr (obj, name) {
    try {
        return name in obj || 'py_' + name in obj;
    }
    catch (exception) {
        return false;
    }
};

export function delattr (obj, name) {
    if (name in obj) {
        delete obj [name];
    }
    else {
        delete obj ['py_' + name];
    }
};
</t>
<t tx="ekr.20201219061310.4">// The __in__ function, used to mimic Python's 'in' operator.

// In addition to CPython's semantics, the 'in' operator is also allowed to work on objects,
// avoiding a counterintuitive separation between Python dicts and JavaScript objects.

// In general many Transcrypt compound types feature a deliberate blend of Python and JavaScript facilities,
// facilitating efficient integration with JavaScript libraries.

// If only Python objects and Python dicts are dealt with in a certain context,
// the more pythonic 'hasattr' is preferred for the objects as opposed to 'in' for the dicts

export function __in__ (element, container) {
    if (container === undefined || container === null) {
        return false;
    }
    if (container.__contains__ instanceof Function) {
        return container.__contains__ (element);
    }
    else {
        // Parameter 'element' itself is an array, string or a plain, non-dict JavaScript object
        return (
            container.indexOf ?                 // If it has an indexOf
            container.indexOf (element) &gt; -1 :  // it's an array or a string,
            container.hasOwnProperty (element)  // else it's a plain, non-dict JavaScript object
        );
    }
};
</t>
<t tx="ekr.20201219061814.1">// Find out if an attribute is special
export function __specialattrib__ (attrib) {
    return (attrib.startswith ('__') &amp;&amp; attrib.endswith ('__')) || attrib == 'constructor' || attrib.startswith ('py_');
};

</t>
<t tx="ekr.20201219061814.2">// Compute length of any object
export function len (anObject) {
    if (anObject === undefined || anObject === null) {
        return 0;
    }

    if (anObject.__len__ instanceof Function) {
        return anObject.__len__ ();
    }

    if (anObject.length !== undefined) {
        return anObject.length;
    }

    var length = 0;
    for (var attr in anObject) {
        if (!__specialattrib__ (attr)) {
            length++;
        }
    }

    return length;
};

</t>
<t tx="ekr.20201219061814.3">// General conversions and checks

export function __i__ (any) {
    //  Convert to iterable
    return py_typeof (any) == dict ? any.py_keys () : any;
}
</t>
<t tx="ekr.20201219062144.1"></t>
<t tx="ekr.20201219062158.1">export function __k__ (keyed, key) {
    //  Check existence of dict key via retrieved element
    var result = keyed [key];
    if (typeof result == 'undefined') {
        if (keyed instanceof Array)
            if (key == +key &amp;&amp; key &gt;= 0 &amp;&amp; keyed.length &gt; key)
                return result;
            else
                throw IndexError (key, new Error());
        else
            throw KeyError (key, new Error());
    }
    return result;
}

</t>
<t tx="ekr.20201219062158.2">// If the target object is somewhat true, return it. Otherwise return false.
// Try to follow Python conventions of truthyness.

export function __t__ (target) { 
    return (
        // Avoid invalid checks
        target === undefined || target === null ? false :
        
        // Take a quick shortcut if target is a simple type
        ['boolean', 'number'] .indexOf (typeof target) &gt;= 0 ? target :
        
        // Use __bool__ (if present) to decide if target is true
        target.__bool__ instanceof Function ? (target.__bool__ () ? target : false) :
        
        // There is no __bool__, use __len__ (if present) instead
        target.__len__ instanceof Function ?  (target.__len__ () !== 0 ? target : false) :
        
        // There is no __bool__ and no __len__, declare Functions true.
        // Python objects are transpiled into instances of Function and if
        // there is no __bool__ or __len__, the object in Python is true.
        target instanceof Function ? target :
        
        // Target is something else, compute its len to decide
        len (target) !== 0 ? target :
        
        // When all else fails, declare target as false
        false
    );
}

</t>
<t tx="ekr.20201219062158.3">export function float (any) {
    if (any == 'inf') {
        return Infinity;
    }
    else if (any == '-inf') {
        return -Infinity;
    }
    else if (any == 'nan') {
        return NaN;
    }
    else if (isNaN (parseFloat (any))) {
        // Call to parseFloat needed to exclude '', ' ' etc.
        if (any === false) {
            return 0;
        }
        else if (any === true) {
            return 1;
        }
        else {
            // Needed e.g. in autoTester.check, so "return any ? true : false" won't do
            throw ValueError ("could not convert string to float: '" + str(any) + "'", new Error ());
        }
    }
    else {
        return +any;
    }
};

float.__name__ = 'float';
float.__bases__ = [object];

export function int (any) {
    return float (any) | 0
};

int.__name__ = 'int';
int.__bases__ = [object];</t>
<t tx="ekr.20201219062645.1">// Reversed function for arrays
export function py_reversed (iterable) {
    iterable = iterable.slice ();
    iterable.reverse ();
    return iterable;
};

</t>
<t tx="ekr.20201219062645.2">// Zip method for arrays and strings
export function zip () {
    var args = [] .slice.call (arguments);
    for (var i = 0; i &lt; args.length; i++) {
        if (typeof args [i] == 'string') {
            args [i] = args [i] .split ('');
        }
        else if (!Array.isArray (args [i])) {
            args [i] = Array.from (args [i]);
        }
    }

    var shortest = args.length == 0 ? [] : args.reduce (
        // Find shortest array in arguments
        function (array0, array1) {
            return array0.length &lt; array1.length ? array0 : array1;
        }
    );

    return shortest.map (
                                                // Map each element of shortest array
        function (current, index) {             // To the result of this function
                return args.map (               // Map each array in arguments
                    function (current) {        // To the result of this function
                        return current [index]; // Namely it's index't entry
                    }
                );
            }
        );
    };
</t>
<t tx="ekr.20201219062646.1">// Range method, returning an array
export function range (start, stop, step) {
    if (stop == undefined) {
        // one param defined
        stop = start;
        start = 0;
    }
    if (step == undefined) {
        step = 1;
    }
    if ((step &gt; 0 &amp;&amp; start &gt;= stop) || (step &lt; 0 &amp;&amp; start &lt;= stop)) {
        return [];
    }
    var result = [];
    for (var i = start; step &gt; 0 ? i &lt; stop : i &gt; stop; i += step) {
        result.push(i);
    }
    return result;
};

</t>
<t tx="ekr.20201219062646.2">// Any, all and sum

export function any (iterable) {
    for (let item of iterable) {
        if (bool (item)) {
            return true;
        }
    }
    return false;
}
export function all (iterable) {
    for (let item of iterable) {
        if (! bool (item)) {
            return false;
        }
    }
    return true;
}
export function sum (iterable) {
    let result = 0;
    for (let item of iterable) {
        result += item;
    }
    return result;
}

</t>
<t tx="ekr.20201219062646.3">// Enumerate method, returning a zipped list
export function enumerate (iterable) {
    return zip (range (len (iterable)), iterable);
}

</t>
<t tx="ekr.20201219063107.1">// Shallow and deepcopy

export function copy (anObject) {
    if (anObject == null || typeof anObject == "object") {
        return anObject;
    }
    else {
        var result = {};
        for (var attrib in obj) {
            if (anObject.hasOwnProperty (attrib)) {
                result [attrib] = anObject [attrib];
            }
        }
        return result;
    }
}

export function deepcopy (anObject) {
    if (anObject == null || typeof anObject == "object") {
        return anObject;
    }
    else {
        var result = {};
        for (var attrib in obj) {
            if (anObject.hasOwnProperty (attrib)) {
                result [attrib] = deepcopy (anObject [attrib]);
            }
        }
        return result;
    }
}
</t>
<t tx="ekr.20201219063107.2">// List extensions to Array

export function list (iterable) {
    // All such creators should be callable without new
    let instance = iterable ? Array.from (iterable) : [];
    // Sort is the normal JavaScript sort, Python sort is a non-member function
    return instance;
}

</t>
<t tx="ekr.20201219063312.1">// All arrays are lists (not only if constructed by the list ctor), unless constructed otherwise.
Array.prototype.__class__ = list;

list.__name__ = 'list';
list.__bases__ = [object];

Array.prototype.__iter__ = function () {
    return new __PyIterator__ (this);
};
</t>
<t tx="ekr.20201219063343.1">// Byte array extensions

export function bytearray (bytable, encoding) {
    if (bytable == undefined) {
        return new Uint8Array (0);
    }
    else {
        let aType = py_typeof (bytable);
        if (aType == int) {
            return new Uint8Array (bytable);
        }
        else if (aType == str) {
            let aBytes = new Uint8Array (len (bytable));
            for (let i = 0; i &lt; len (bytable); i++) {
                aBytes [i] = bytable.charCodeAt (i);
            }
            return aBytes;
        }
        else if (aType == list || aType == tuple) {
            return new Uint8Array (bytable);
        }
        else {
            throw py_TypeError;
        }
    }
}

export var bytes = bytearray;
</t>
<t tx="ekr.20201219063457.1"></t>
<t tx="ekr.20201219063510.1">// String extensions

export function str (stringable) {
    if (typeof stringable === 'number')
        return stringable.toString();
    else {
        try {
            return stringable.__str__ ();
        }
        catch (exception) {
            try {
                return repr (stringable);
            }
            catch (exception) {
                // No new, so no permanent String object
                // but a primitive in a temporary 'just in time' wrapper
                return String (stringable);
            }
        }
    }
};

</t>
<t tx="ekr.20201219063829.1">// Since it's worthwhile for the 'format' function to be able to deal with
// *args, it is defined as a property.

// __get__ will produce a bound function if there's something before the dot.

// Since a call using *args is compiled to e.g. &lt;object&gt;.&lt;function&gt;.apply
// (null, args), the function has to be bound already. Otherwise it will never
// be, because of the null argument Using 'this' rather than 'null'
// contradicts the requirement to be able to pass bound functions around.

// The object 'before the dot' won't be available at call time in that case,
// unless implicitly via the function bound to it.

// While for Python methods this mechanism is generated by the compiler, for
// JavaScript methods it has to be provided manually Call memoizing is
// unattractive here, since every string would then have to hold a reference
// to a bound format method.


// EKR: This was a major import failure. I restored it from the original.

__setproperty__ (String.prototype, 'format', {
    get: function () {return __get__ (this, function (self) {
        var args = tuple ([] .slice.apply (arguments).slice (1));
        var autoIndex = 0;
        
__pragma__ ('ifdef', '__sform__')

        return self.replace (/\{([^\{]*)\}/g, function (match, key) {
            var parts = key.split (':');
            key = parts [0];
            var fmt_spec = parts [1];
            parts = key.split ('!')
            key = parts [0];
            var conversion = parts [1];
            var value = undefined;
            if (key == '') {
                key = autoIndex++;
            }
            if (key == +key &amp;&amp; args [key] !== undefined) {  // So key is numerical
                value = args [key];
            }
            else {              // Key is a string
                var attr = undefined;
                var idx = key.indexOf ('.');
                if (idx != -1) {
                    attr = key.substring (idx + 1);
                    key = key.substring (0, idx);
                }
                else {
                    idx = key.indexOf ('[');
                    if (idx != -1) {
                        attr = key.substring (idx + 1).slice (0, -1);
                        key = key.substring (0, idx);
                    }
                }
                    
                if ((key == +key) &amp;&amp; attr &amp;&amp; args [key] !== undefined) {
                    value = args [key][attr];
                }
                else {
                    for (var index = 0; index &lt; args.length; index++) {
                        // Find first 'dict' that has that key and the right field
                        if (typeof args [index] == 'object' &amp;&amp; args [index][key] !== undefined) {
                            // Return that field field
                            if (attr) {
                                value = args [index][key][attr];
                            }
                            else {
                                value = args [index][key]; 
                            }
                            break;
                        }
                    }
                }
            }
            if (value === undefined) {
                return match;
            }
            if (conversion == 'r') {
                value = repr (value);
            }
            else if (conversion == 's') {
                value = str (value);
            }
            else if (conversion == 'a') {
                throw ValueError ("Conversion to ascii not yet supported: '" + match + "'", new Error ());
            }
            return format (value, fmt_spec);
        });
        
__pragma__ ('else')

        return self.replace (/\{(\w*)\}/g, function (match, key) {
            if (key == '') {
                key = autoIndex++;
            }
            if (key == +key) {  // So key is numerical
                return args [key] === undefined ? match : str (args [key]);
            }
            else {              // Key is a string
                for (var index = 0; index &lt; args.length; index++) {
                    // Find first 'dict' that has that key and the right field
                    if (typeof args [index] == 'object' &amp;&amp; args [index][key] !== undefined) {
                        return str (args [index][key]); // Return that field field
                    }
                }
                return match;
            }
        });
        
__pragma__ ('endif')

    });},
    enumerable: true
});</t>
<t tx="ekr.20201219064825.1">// Dict extensions to object...</t>
<t tx="ekr.20201219064950.1">export function dict (objectOrPairs) {
    var instance = {};
    if (!objectOrPairs || objectOrPairs instanceof Array) { // It's undefined or an array of pairs
        if (objectOrPairs) {
            for (var index = 0; index &lt; objectOrPairs.length; index++) {
                var pair = objectOrPairs [index];
                if ( !(pair instanceof Array) || pair.length != 2) {
                    throw ValueError(
                        "dict update sequence element #" + index +
                        " has length " + pair.length +
                        "; 2 is required", new Error());
                }
                var key = pair [0];
                var val = pair [1];
                if (!(objectOrPairs instanceof Array) &amp;&amp; objectOrPairs instanceof Object) {
                     // User can potentially pass in an object
                     // that has a hierarchy of objects. This
                     // checks to make sure that these objects
                     // get converted to dict objects instead of
                     // leaving them as js objects.
                     
                     if (!isinstance (objectOrPairs, dict)) {
                         val = dict (val);
                     }
                }
                instance [key] = val;
            }
        }
    }
    else {
        if (isinstance (objectOrPairs, dict)) {
            // Passed object is a dict already so we need to be a little careful
            // N.B. - this is a shallow copy per python std - so
            // it is assumed that children have already become
            // python objects at some point.
            
            var aKeys = objectOrPairs.py_keys ();
            for (var index = 0; index &lt; aKeys.length; index++ ) {
                var key = aKeys [index];
                instance [key] = objectOrPairs [key];
            }
        } else if (objectOrPairs instanceof Object) {
            // Passed object is a JavaScript object but not yet a dict, don't copy it
            instance = objectOrPairs;
        } else {
            // We have already covered Array so this indicates
            // that the passed object is not a js object - i.e.
            // it is an int or a string, which is invalid.
            
            throw ValueError ("Invalid type of object for dict creation", new Error ());
        }
    }

    // Trancrypt interprets e.g. {aKey: 'aValue'} as a Python dict literal rather than a JavaScript object literal
    // So dict literals rather than bare Object literals will be passed to JavaScript libraries
    // Some JavaScript libraries call all enumerable callable properties of an object that's passed to them
    // So the properties of a dict should be non-enumerable
    __setproperty__ (instance, '__class__', {value: dict, enumerable: false, writable: true});
    __setproperty__ (instance, '__contains__', {value: __contains__, enumerable: false});
    __setproperty__ (instance, 'py_keys', {value: __keys__, enumerable: false});
    __setproperty__ (instance, '__iter__', {value: function () {new __PyIterator__ (this.py_keys ());}, enumerable: false});
    __setproperty__ (instance, Symbol.iterator, {value: function () {new __JsIterator__ (this.py_keys ());}, enumerable: false});
    __setproperty__ (instance, 'py_items', {value: __items__, enumerable: false});
    __setproperty__ (instance, 'py_del', {value: __del__, enumerable: false});
    __setproperty__ (instance, 'py_clear', {value: __clear__, enumerable: false});
    __setproperty__ (instance, 'py_get', {value: __getdefault__, enumerable: false});
    __setproperty__ (instance, 'py_setdefault', {value: __setdefault__, enumerable: false});
    __setproperty__ (instance, 'py_pop', {value: __pop__, enumerable: false});
    __setproperty__ (instance, 'py_popitem', {value: __popitem__, enumerable: false});
    __setproperty__ (instance, 'py_update', {value: __update__, enumerable: false});
    __setproperty__ (instance, 'py_values', {value: __values__, enumerable: false});
    __setproperty__ (instance, '__getitem__', {value: __dgetitem__, enumerable: false});    // Needed since compound keys necessarily
    __setproperty__ (instance, '__setitem__', {value: __dsetitem__, enumerable: false});    // trigger overloading to deal with slices
    return instance;
}

dict.__name__ = 'dict';
dict.__bases__ = [object];
</t>
<t tx="ekr.20201219065042.1">// General operator overloading.
// only the ones that make most sense in matrix and complex operations

export function __jsmod__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__mod__' in a) {
        return a.__mod__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rmod__' in b) {
        return b.__rmod__ (a);
    }
    else {
        return a % b;
    }
};

export function __mod__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__mod__' in a) {
        return a.__mod__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rmod__' in b) {
        return b.__rmod__ (a);
    }
    else {
        return ((a % b) + b) % b;
    }
};


export function __pow__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__pow__' in a) {
        return a.__pow__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rpow__' in b) {
        return b.__rpow__ (a);
    }
    else {
        return Math.pow (a, b);
    }
};

export var pow = __pow__;   // Make available as builin under usual name

__pragma__ ('ifndef', '__xtiny__')

@others  

__pragma__ ('endif')
</t>
<t tx="ekr.20201219065216.1">export function __neg__ (a) {
    if (typeof a == 'object' &amp;&amp; '__neg__' in a) {
        return a.__neg__ ();
    }
    else {
        return -a;
    }
};

export function __matmul__ (a, b) {
    return a.__matmul__ (b);
};

</t>
<t tx="ekr.20201219065440.1">// Overloaded binary arithmetic

export function __mul__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__mul__' in a) {
        return a.__mul__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rmul__' in b) {
        return b.__rmul__ (a);
    }
    else if (typeof a == 'string') {
        return a.__mul__ (b);
    }
    else if (typeof b == 'string') {
        return b.__rmul__ (a);
    }
    else {
        return a * b;
    }
};

export function __truediv__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__truediv__' in a) {
        return a.__truediv__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rtruediv__' in b) {
        return b.__rtruediv__ (a);
    }
    else if (typeof a == 'object' &amp;&amp; '__div__' in a) {
        return a.__div__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rdiv__' in b) {
        return b.__rdiv__ (a);
    }
    else {
        return a / b;
    }
};

export function __floordiv__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__floordiv__' in a) {
        return a.__floordiv__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rfloordiv__' in b) {
        return b.__rfloordiv__ (a);
    }
    else if (typeof a == 'object' &amp;&amp; '__div__' in a) {
        return a.__div__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rdiv__' in b) {
        return b.__rdiv__ (a);
    }
    else {
        return Math.floor (a / b);
    }
};

export function __add__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__add__' in a) {
        return a.__add__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__radd__' in b) {
        return b.__radd__ (a);
    }
    else {
        return a + b;
    }
};

export function __sub__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__sub__' in a) {
        return a.__sub__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rsub__' in b) {
        return b.__rsub__ (a);
    }
    else {
        return a - b;
    }
};
</t>
<t tx="ekr.20201219065527.1">// Overloaded binary bitwise

export function __lshift__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__lshift__' in a) {
        return a.__lshift__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rlshift__' in b) {
        return b.__rlshift__ (a);
    }
    else {
        return a &lt;&lt; b;
    }
};

export function __rshift__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__rshift__' in a) {
        return a.__rshift__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rrshift__' in b) {
        return b.__rrshift__ (a);
    }
    else {
        return a &gt;&gt; b;
    }
};

export function __or__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__or__' in a) {
        return a.__or__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__ror__' in b) {
        return b.__ror__ (a);
    }
    else {
        return a | b;
    }
};

export function __xor__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__xor__' in a) {
        return a.__xor__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rxor__' in b) {
        return b.__rxor__ (a);
    }
    else {
        return a ^ b;
    }
};

export function __and__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__and__' in a) {
        return a.__and__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rand__' in b) {
        return b.__rand__ (a);
    }
    else {
        return a &amp; b;
    }
};
</t>
<t tx="ekr.20201219065621.1">// Overloaded binary compare

export function __eq__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__eq__' in a) {
        return a.__eq__ (b);
    }
    else {
        return a == b;
    }
};

export function __ne__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__ne__' in a) {
        return a.__ne__ (b);
    }
    else {
        return a != b
    }
};

export function __lt__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__lt__' in a) {
        return a.__lt__ (b);
    }
    else {
        return a &lt; b;
    }
};

export function __le__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__le__' in a) {
        return a.__le__ (b);
    }
    else {
        return a &lt;= b;
    }
};

export function __gt__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__gt__' in a) {
        return a.__gt__ (b);
    }
    else {
        return a &gt; b;
    }
};

export function __ge__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__ge__' in a) {
        return a.__ge__ (b);
    }
    else {
        return a &gt;= b;
    }
};
</t>
<t tx="ekr.20201219065653.1">// Overloaded augmented general

export function __imatmul__ (a, b) {
    if ('__imatmul__' in a) {
        return a.__imatmul__ (b);
    }
    else {
        return a.__matmul__ (b);
    }
};

export function __ipow__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__pow__' in a) {
        return a.__ipow__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__ipow__' in a) {
        return a.__pow__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rpow__' in b) {
        return b.__rpow__ (a);
    }
    else {
        return Math.pow (a, b);
    }
};

export function __ijsmod__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__imod__' in a) {
        return a.__ismod__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__mod__' in a) {
        return a.__mod__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rpow__' in b) {
        return b.__rmod__ (a);
    }
    else {
        return a % b;
    }
};

export function __imod__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__imod__' in a) {
        return a.__imod__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__mod__' in a) {
        return a.__mod__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rmod__' in b) {
        return b.__rmod__ (a);
    }
    else {
        return ((a % b) + b) % b;
    }
};</t>
<t tx="ekr.20201219065719.1">// Overloaded augmented arithmetic

export function __imul__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__imul__' in a) {
        return a.__imul__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__mul__' in a) {
        return a = a.__mul__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rmul__' in b) {
        return a = b.__rmul__ (a);
    }
    else if (typeof a == 'string') {
        return a = a.__mul__ (b);
    }
    else if (typeof b == 'string') {
        return a = b.__rmul__ (a);
    }
    else {
        return a *= b;
    }
};

export function __idiv__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__idiv__' in a) {
        return a.__idiv__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__div__' in a) {
        return a = a.__div__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rdiv__' in b) {
        return a = b.__rdiv__ (a);
    }
    else {
        return a /= b;
    }
};

export function __iadd__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__iadd__' in a) {
        return a.__iadd__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__add__' in a) {
        return a = a.__add__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__radd__' in b) {
        return a = b.__radd__ (a);
    }
    else {
        return a += b;
    }
};

export function __isub__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__isub__' in a) {
        return a.__isub__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__sub__' in a) {
        return a = a.__sub__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rsub__' in b) {
        return a = b.__rsub__ (a);
    }
    else {
        return a -= b;
    }
};

</t>
<t tx="ekr.20201219065746.1">// Indices and slices

export function __getitem__ (container, key) {
    // Slice c.q. index, direct generated call to runtime switch
    if (typeof container == 'object' &amp;&amp; '__getitem__' in container) {
        return container.__getitem__ (key);
            // Overloaded on container
    }
    else if ((typeof container == 'string' || container instanceof Array) &amp;&amp; key &lt; 0) {
        return container [container.length + key];
    }
    else {
        return container [key];
            // Container must support bare JavaScript brackets
        
        /*
            If it turns out keychecks really have to be supported here, the
            following will work
            
                return __k__ (container, key);
                
            Could be inlined rather than a call, but performance not crucial
            since non overloaded [] in context of overloaded [] is rare High
            volume numerical code will use Numscrypt anyhow which does many
            things via shortcuts
        */
    }
};

export function __setitem__ (container, key, value) {
    // Slice c.q. index, direct generated call to runtime switch
    if (typeof container == 'object' &amp;&amp; '__setitem__' in container) {
        container.__setitem__ (key, value);
            // Overloaded on container
    }
    else if ((typeof container == 'string' || container instanceof Array) &amp;&amp; key &lt; 0) {
        container [container.length + key] = value;
    }
    else {
        container [key] = value;
            // Container must support bare JavaScript brackets
    }
};

export function __getslice__ (container, lower, upper, step) {
    // Slice only, no index, direct generated call to runtime switch
    if (typeof container == 'object' &amp;&amp; '__getitem__' in container) {
        return container.__getitem__ ([lower, upper, step]);
            // Container supports overloaded slicing c.q. indexing
    }
    else {
        return container.__getslice__ (lower, upper, step);
            // Container only supports slicing injected natively in prototype
    }
};

export function __setslice__ (container, lower, upper, step, value) {
    // Slice, no index, direct generated call to runtime switch
    if (typeof container == 'object' &amp;&amp; '__setitem__' in container) {
        container.__setitem__ ([lower, upper, step], value);
            // Container supports overloaded slicing c.q. indexing
    }
    else {
        container.__setslice__ (lower, upper, step, value);
            // Container only supports slicing injected natively in prototype
    }
};
</t>
<t tx="ekr.20201219070052.1">// Overloaded augmented bitwise

export function __ilshift__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__ilshift__' in a) {
        return a.__ilshift__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__lshift__' in a) {
        return a = a.__lshift__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rlshift__' in b) {
        return a = b.__rlshift__ (a);
    }
    else {
        return a &lt;&lt;= b;
    }
};

export function __irshift__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__irshift__' in a) {
        return a.__irshift__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__rshift__' in a) {
        return a = a.__rshift__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rrshift__' in b) {
        return a = b.__rrshift__ (a);
    }
    else {
        return a &gt;&gt;= b;
    }
};

export function __ior__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__ior__' in a) {
        return a.__ior__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__or__' in a) {
        return a = a.__or__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__ror__' in b) {
        return a = b.__ror__ (a);
    }
    else {
        return a |= b;
    }
};
    
export function __ixor__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__ixor__' in a) {
        return a.__ixor__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__xor__' in a) {
        return a = a.__xor__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rxor__' in b) {
        return a = b.__rxor__ (a);
    }
    else {
        return a ^= b;
    }
};

export function __iand__ (a, b) {
    if (typeof a == 'object' &amp;&amp; '__iand__' in a) {
        return a.__iand__ (b);
    }
    else if (typeof a == 'object' &amp;&amp; '__and__' in a) {
        return a = a.__and__ (b);
    }
    else if (typeof b == 'object' &amp;&amp; '__rand__' in b) {
        return a = b.__rand__ (a);
    }
    else {
        return a &amp;= b;
    }
};
</t>
<t tx="ekr.20201219070811.1">export function __nest__ (headObject, tailNames, value) { 
   
    var current = headObject;
    
    // In some cases this will be &lt;main function&gt;.__all__,
    // which is the main module and is also known under the synonym &lt;main function.__world__.

    // N.B. &lt;main function&gt; is the entry point of a Transcrypt application,
    // Carrying the same name as the application except the file name extension.
    
    if (tailNames != '') {  // Split on empty string doesn't give empty list
        // Find the last already created object in tailNames
        var tailChain = tailNames.split ('.');
        var firstNewIndex = tailChain.length;
        for (var index = 0; index &lt; tailChain.length; index++) {
            if (!current.hasOwnProperty (tailChain [index])) {
                firstNewIndex = index;
                break;
            }
            current = current [tailChain [index]];
        }
        
        // Create the rest of the objects, if any
        for (var index = firstNewIndex; index &lt; tailChain.length; index++) {
            current [tailChain [index]] = {};
            current = current [tailChain [index]];
        }
    }
    
    // Insert its new properties, it may have been created earlier and have other attributes     
    for (let attrib of Object.getOwnPropertyNames (value)) {       
        Object.defineProperty (current, attrib, {
            get () {return value [attrib];},
            enumerable: true,
            configurable: true        
        });
    }
};
</t>
<t tx="ekr.20201219070813.1">// Initialize module if not yet done and return its globals
export function __init__ (module) {
    if (!module.__inited__) {
        module.__all__.__init__ (module.__all__);
        module.__inited__ = true;
    }
    return module.__all__;
};
</t>
<t tx="ekr.20201219070813.2">// Proxy switch, controlled by __pragma__ ('proxy') and __pragma ('noproxy')

export var __proxy__ = false;
    // No use assigning it to __all__,
    // only its transient state is important.
</t>
<t tx="ekr.20201219070814.1">// Since we want to assign functions,
// a = b.f should make b.f produce a bound function.

// So __get__ should be called by a property rather then a function.

// Factory __get__ creates one of three curried functions for func.
// Which one is produced depends on what's to the left of the dot
// of the corresponding JavaScript property.

export function __get__ (self, func, quotedFuncName) {
    if (self) {
        if (self.hasOwnProperty ('__class__') || typeof self == 'string' || self instanceof String) {
            // Object before the dot.
            if (quotedFuncName) {
                // Memoize call since fcall is on, by installing bound function in instance
                // Will override the non-own property, next time it will be called directly
                // So next time just call curry function that calls function
                Object.defineProperty (self, quotedFuncName, {
                    value: function () {
                        var args = [] .slice.apply (arguments);
                        return func.apply (null, [self] .concat (args));
                    },              
                    writable: true,
                    enumerable: true,
                    configurable: true
                });
            }
            return function () {
                // Return bound function, code dupplication for efficiency if no memoizing
                // So multilayer search prototype, apply __get__, call curry func that calls func.
                var args = [] .slice.apply (arguments);             
                return func.apply (null, [self] .concat (args));
            };
        }
        else {
            // Class before the dot. Return static method.
            return func;                                           
        }
    }
    else {
        // Nothing before the dot. Return free function
        return func; 
    }
};
</t>
<t tx="ekr.20201219070835.1">
/*

Nested module-object creator, part of the nesting may already exist and
have attributes

A Transcrypt applicaton consists of a main module and additional modules.

Transcrypt modules constitute a unique, unambiguous tree by their dotted
names, no matter which of the alternative module root paths they come from.

The main module is represented by a main function with the name of the
application. The locals of this function constitute the outer namespace of
the Transcrypt application. References to all local variables of this
function are also assigned to attributes of local variable __all__, using
the variable names as an attribute names. The main function returns this
local variable __all__ (that inside the function is also known by the name
__world__).

Normally this function result is assigned to window.&lt;application
name&gt;. The function may than be exitted (unless its main line starts an
ongoing activity), but the application namespace stays alive by the
reference that window has to it. In case of the ongoing activity including
the script is enough to start it, in other cases it has to be started
explicitly by calling window.&lt;application name&gt;.&lt;entrypoint function&gt;.
There may be multiple such entrypoint functions.

Additional modules are represented by objects rather than functions, nested
into __world__ (so into __all__ of the main function). This nesting can be
directly or indirectly, according to the dotted paths of the additional
modules. One of the methods of the module object is the __init__ function,
that's executed once at module initialisation time.

The additional modules also have an __all__ variable, an attribute rather
than a local variable. However this __all__ object is passed to the
__init__ function, so becomes a local variable there.

Variables in additional modules first become locals to the __init__
function but references to all of them are assigned to __all__ under their
same names. This resembles the cause of affairs in the main function.
However __world__ only referes to the __all__ of the main module, not of
any additional modules.

Importing a module boils down to adding all members of its __all__ to the
local namespace, directly or via dotted access, depending on the way of
import.

In each local namespace of the module function (main function for main
module, __init__ for additional modules) there's a variable __name__
holding the name of the module.

Classes are created inside the static scope of a particular module, and at
that (class creation) time their variable __module__ gets assigned a
reference to __name__. This assignement is generated explicitly by the
compiler, as the class creation function __new__ of the metaclass isn't in
the static scope containing __name__.

In case of
    import a
    import a.b
    
a will have been created at the moment that a.b is imported, so all a.b. is
allowed to do is an extra attribute in a, namely a reference to b, not
recreate a, since that would destroy attributes previously present in a

In case of
    import a.b
    import a
    
a will have to be created at the moment that a.b is imported

In general in a chain
    import a.b.c.d.e
    
a, a.b, a.b.c and a.b.c.d have to exist before e is created, since a.b.c.d
should hold a reference to e. Since this applies recursively, if e.g. c is
already created, we can be sure a and a.b. will also be already created.

So to be able to create e, we'll have to walk the chain a.b.c.d, starting
with a. As soon as we encounter a module in the chain that isn't already
there, we'll have to create the remainder (tail) of the chain.

e.g.
    import a.b.c.d.e
    import a.b.c

will generate
    var modules = {};
    __nest__ (a, 'b.c.d.e', __init__ (__world__.a.b.c.d.e));
    __nest__ (a, 'b.c', __init__ (__world__.a.b.c));
    
The task of the __nest__ function is to start at the head object and then
walk to the chain of objects behind it (tail), creating the ones that do
not exist already, and insert the necessary module reference attributes
into them.

*/</t>
<t tx="ekr.20201219071110.1">export function __getcm__ (self, func, quotedFuncName) {
    if (self.hasOwnProperty ('__class__')) {
        return function () {
            var args = [] .slice.apply (arguments);
            return func.apply (null, [self.__class__] .concat (args));
        };
    }
    else {
        return function () {
            var args = [] .slice.apply (arguments);
            return func.apply (null, [self] .concat (args));
        };
    }
};

export function __getsm__ (self, func, quotedFuncName) {
    return func;
};
    
</t>
<t tx="ekr.20201219071113.1">// Mother of all metaclasses        
export var py_metatype = {

    __name__: 'type',
    __bases__: [],
    
    // Overridable class creation worker
    __new__: function (meta, name, bases, attribs) {
    
        // Create the class cls, a functor, which the class creator function will return.
        // If cls is called with arg0, arg1, etc, it calls its __new__ method with [arg0, arg1, etc].
        // It has a __new__ method, not yet but at call time, since it is copied from the parent in the loop below.
        // Each Python class directly or indirectly derives from object, which has the __new__ method.
        // If there are no bases in the Python source, the compiler generates [object] for this parameter.
    
        var cls = function () { 
            var args = [] .slice.apply (arguments);
            return cls.__new__ (args);
        };
        
        // Copy all methods, including __new__, properties and static attributes from base classes to new cls object
        // The new class object will simply be the prototype of its instances
        // JavaScript prototypical single inheritance will do here, since any object has only one class
        // This has nothing to do with Python multiple inheritance, that is implemented explictly in the copy loop below.
        
        // Reversed order, since class vars of first base should win.
        for (var index = bases.length - 1; index &gt;= 0; index--) {   
            var base = bases [index];
            for (var attrib in base) {
                var descrip = Object.getOwnPropertyDescriptor (base, attrib);
                Object.defineProperty (cls, attrib, descrip);
            }           
            for (let symbol of Object.getOwnPropertySymbols (base)) {
                let descrip = Object.getOwnPropertyDescriptor (base, symbol);
                Object.defineProperty (cls, symbol, descrip);
            }
        }
        
        // Add class specific attributes to the created cls object
        cls.__metaclass__ = meta;
        cls.__name__ = name.startsWith ('py_') ? name.slice (3) : name;
        cls.__bases__ = bases;
        
        // Add own methods, properties and own static attributes to the created cls object
        for (var attrib in attribs) {
            var descrip = Object.getOwnPropertyDescriptor (attribs, attrib);
            Object.defineProperty (cls, attrib, descrip);
        }
        for (let symbol of Object.getOwnPropertySymbols (attribs)) {
            let descrip = Object.getOwnPropertyDescriptor (attribs, symbol);
            Object.defineProperty (cls, symbol, descrip);
        }

        // Return created cls object
        return cls;
    }
};

py_metatype.__metaclass__ = py_metatype;
</t>
<t tx="ekr.20201219071113.2">// Mother of all classes
export var object = {

    __init__: function (self) {},
    __metaclass__: py_metatype, // By default, all classes have metaclass type, since they derive from object
    __name__: 'object',
    __bases__: [],
        
    // Object creator function, is inherited by all classes (so could be global)
    __new__: function (args) {
        // Args are just the constructor args
        
        // In JavaScript the Python class is the prototype of the Python object
        // In this way methods and static attributes will be available both with a class and an object before the dot.
        // The descriptor produced by __get__ will return the right method flavor.
    
        var instance = Object.create (this, {__class__: {value: this, enumerable: true}});
        
        if ('__getattr__' in this || '__setattr__' in this) {
            instance = new Proxy (instance, {
                get: function (target, name) {
                    let result = target [name];
                    if (result == undefined) {
                        // Target doesn't have attribute named name
                        return target.__getattr__ (name);
                    }
                    else {
                        return result;
                    }
                },
                set: function (target, name, value) {
                    try {
                        target.__setattr__ (name, value);
                    }
                    catch (exception) {
                        // Target doesn't have a __setattr__ method
                        target [name] = value;
                    }
                    return true;
                }
            })
        }

        // Call constructor
        this.__init__.apply (null, [instance] .concat (args));

        // Return constructed instance
        return instance;
    }   
};
</t>
<t tx="ekr.20201219071258.1">// Class creator facade function, calls class creation worker
export function __class__ (name, bases, attribs, meta) { // Parameter meta is optional
    if (meta === undefined) {
        meta = bases [0] .__metaclass__;
    }
            
    return meta.__new__ (meta, name, bases, attribs);
};

// Define __pragma__ to preserve '&lt;all&gt;' and '&lt;/all&gt;'.
// Since it's never generated as a function, must be done early, so here.
export function __pragma__ () {};
</t>
<t tx="ekr.20201219073300.1">export function bool (any) {
    // Always truly returns a bool, rather than something truthy or falsy
    return !!__t__ (any);
};
bool.__name__ = 'bool'; // So it can be used as a type with a name
bool.__bases__ = [int];

</t>
<t tx="ekr.20201219073301.1">export function py_typeof (anObject) {
    var aType = typeof anObject;
    if (aType == 'object') {
        // Directly trying '__class__ in anObject' turns out to wreck anObject in Chrome if its a primitive
        try {
            return '__class__' in anObject ? anObject.__class__ : object;
        }
        catch (exception) {
            return aType;
        }
    }
    else {
        return (
            // Odly, the braces are required here
            aType == 'boolean' ? bool :
            aType == 'string' ? str :
            aType == 'number' ? (anObject % 1 == 0 ? int : float) :
            null
        );
    }
};

</t>
<t tx="ekr.20201219073301.2">export function issubclass (aClass, classinfo) {
    if (classinfo instanceof Array) {
        // Assume in most cases it isn't, then making it recursive rather than two functions saves a call
        for (let aClass2 of classinfo) {
            if (issubclass (aClass, aClass2)) {
                return true;
            }
        }
        return false;
    }
    try {
        var aClass2 = aClass;
        if (aClass2 == classinfo) {
            return true;
        }
        else {
            var bases = [].slice.call (aClass2.__bases__);
            while (bases.length) {
                aClass2 = bases.shift ();
                if (aClass2 == classinfo) {
                    return true;
                }
                if (aClass2.__bases__.length) {
                    bases = [].slice.call (aClass2.__bases__).concat (bases);
                }
            }
            return false;
        }
    }
    catch (exception) {  // Using issubclass on primitives assumed rare 
        return aClass == classinfo || classinfo == object;
    }
};

</t>
<t tx="ekr.20201219073301.3">// Maximum of n numbers
export function max (nrOrSeq) {
    return arguments.length == 1 ? Math.max (...nrOrSeq) : Math.max (...arguments);       
};

// Minimum of n numbers
export function min (nrOrSeq) {
    return arguments.length == 1 ? Math.min (...nrOrSeq) : Math.min (...arguments);       
};

// Absolute value
__pragma__ ('ifdef', '__complex__')
export function abs (x) {
    try {
        return Math.abs (x);
    }
    catch (exception) {
        return Math.sqrt (x.real * x.real + x.imag * x.imag);
    }
};
__pragma__ ('else')
export var abs = Math.abs;
__pragma__ ('endif')

// Bankers rounding
export function round (number, ndigits) {
    if (ndigits) {
        var scale = Math.pow (10, ndigits);
        number *= scale;
    }

    var rounded = Math.round (number);
    if (rounded - number == 0.5 &amp;&amp; rounded % 2) {   // Has rounded up to odd, should have rounded down to even
        rounded -= 1;
    }

    if (ndigits) {
        rounded /= scale;
    }

    return rounded;
};

</t>
<t tx="ekr.20201219073411.1">export function isinstance (anObject, classinfo) {
    try {
        return '__class__' in anObject ? issubclass (anObject.__class__, classinfo) : issubclass (py_typeof (anObject), classinfo);
    }
    catch (exception) {
        return issubclass (py_typeof (anObject), classinfo);
    }
};

</t>
<t tx="ekr.20201219073411.2">export function callable (anObject) {
    return anObject &amp;&amp; typeof anObject == 'object' &amp;&amp; '__call__' in anObject ? true : typeof anObject === 'function';
};

</t>
<t tx="ekr.20201219073411.3">// Repr function uses __repr__ method, then __str__, then toString
export function repr (anObject) {
    try {
        return anObject.__repr__ ();
    }
    catch (exception) {
        try {
            return anObject.__str__ ();
        }
        catch (exception) { // anObject has no __repr__ and no __str__
            try {
                if (anObject == null) {
                    return 'None';
                }
                else if (anObject.constructor == Object) {
                    var result = '{';
                    var comma = false;
                    for (var attrib in anObject) {
                        if (!__specialattrib__ (attrib)) {
                            if (attrib.isnumeric ()) {
                                var attribRepr = attrib;                // If key can be interpreted as numerical, we make it numerical
                            }                                           // So we accept that '1' is misrepresented as 1
                            else {
                                var attribRepr = '\'' + attrib + '\'';  // Alpha key in dict
                            }

                            if (comma) {
                                result += ', ';
                            }
                            else {
                                comma = true;
                            }
                            result += attribRepr + ': ' + repr (anObject [attrib]);
                        }
                    }
                    result += '}';
                    return result;
                }
                else {
                    return typeof anObject == 'boolean' ? anObject.toString () .capitalize () : anObject.toString ();
                }
            }
            catch (exception) {
                return '&lt;object of type: ' + typeof anObject + '&gt;';
            }
        }
    }
};

// Char from Unicode or ASCII
export function chr (charCode) {
    return String.fromCharCode (charCode);
};

// Unicode or ASCII from char
export function ord (aChar) {
    return aChar.charCodeAt (0);
};

</t>
<t tx="ekr.20201219073525.1">__pragma__ ('ifdef', '__sform__')
export function format (value, fmt_spec) {
    if (value == undefined) {
        return 'None';
    }
    fmt_spec = fmt_spec || '';
    var tval = typeof value;
    switch (tval) {
        case 'number':
        case 'string':
            return value.__format__(fmt_spec);
        case 'boolean':
            return fmt_spec ? (value ? 1 : 0).__format__(fmt_spec) : str (value);
        case 'object':
            if ('__format__' in value) {
                return value.__format__ (fmt_spec);
            }
            else {
                return str (value).__format__ (fmt_spec);
            }
        default:
            return str (value).__format__ (fmt_spec);
    }        
}
__pragma__ ('endif')

</t>
<t tx="ekr.20201219073525.2">export function __jsUsePyNext__ () {
    // Add as 'next' method to make Python iterator JavaScript compatible
    try {
        var result = this.__next__ ();
        return {value: result, done: false};
    }
    catch (exception) {
        return {value: undefined, done: true};
    }
}

export function __pyUseJsNext__ () {
    // Add as '__next__' method to make JavaScript iterator Python compatible
    var result = this.next ();
    if (result.done) {
        throw StopIteration (new Error ());
    }
    else {
        return result.value;
    }
}

</t>
<t tx="ekr.20201219073525.3">export function py_iter (iterable) {

    // Alias for Python's iter function, produces a universal iterator / iterable, usable in Python and JavaScript
    // JavaScript Array or string or Python iterable (string has no 'in')

    if (typeof iterable == 'string' || '__iter__' in iterable) {
        var result = iterable.__iter__ ();              // Iterator has a __next__
        result.next = __jsUsePyNext__;                  // Give it a next
    }
    else if ('selector' in iterable) {
        // Assume it's a JQuery iterator
        var result = list (iterable) .__iter__ ();      // Has a __next__
        result.next = __jsUsePyNext__;                  // Give it a next
    }
    else if ('next' in iterable) {
        // It's a JavaScript iterator already,  maybe a generator, has a next and may have a __next__
        var result = iterable
        if (! ('__next__' in result)) {             // If there's no danger of recursion
            result.__next__ = __pyUseJsNext__;      // Give it a __next__
        }
    }
    else if (Symbol.iterator in iterable) {
        // It's a JavaScript iterable such as a typed array, but not an iterator
        var result = iterable [Symbol.iterator] (); // Has a next
        result.__next__ = __pyUseJsNext__;          // Give it a __next__
    }
    else {
        throw IterableError (new Error ()); // No iterator at all
    }
    result [Symbol.iterator] = function () {return result;};
    return result;
}

</t>
<t tx="ekr.20201219073625.1">// BEGIN unified iterator model

@others

// END unified iterator model
</t>
<t tx="ekr.20201219073819.1">export function py_next (iterator) {

    // Called only in a Python context, could receive Python or JavaScript iterator
    // Primarily assume Python iterator, for max speed.

    try {
        var result = iterator.__next__ ();
    }
    // JavaScript iterators are the exception here
    catch (exception) {
        var result = iterator.next ();
        if (result.done) {
            throw StopIteration (new Error ());
        }
        else {
            return result.value;
        }
    }
    if (result == undefined) {
        throw StopIteration (new Error ());
    }
    else {
        return result;
    }
}

</t>
<t tx="ekr.20201219073820.1">export function __PyIterator__ (iterable) {
    this.iterable = iterable;
    this.index = 0;
}

</t>
<t tx="ekr.20201219074532.1"></t>
<t tx="ekr.20201226145856.1">if isMethod:
    if jsCall:
        # Decorators are not supported until we resolve, how to pass self or cls
        raise utils.Error (
            lineNr=self.lineNr,
            message='\n\tdecorators are not supported with jscall\n'
        )

        self.emit ('{}: ', self.filterId (nodeName))
    else:
        self.emit ('get {} () {{return {} (this, ', self.filterId (nodeName), getter)
elif isGlobal:
    ###
    ### EKR: vs doesn't like export: see note in parent node.
    ###
    if type (node.parentNode) == ast.Module and not nodeName in self.allOwnNames:
        self.emit ('export ')
    self.emit ('var {} = ', self.filterId (nodeName))
else:
    self.emit ('var {} = ', self.filterId (nodeName))

if self.allowOperatorOverloading:
    self.emit ('__call__ (')

for decorator in node.decorator_list:
    if not (type (decorator) == ast.Name and decorator.id in ('classmethod', 'staticmethod')):
        if decoratorsUsed &gt; 0:
            self.emit (' (')
        self.visit (decorator)
        decoratorsUsed += 1

if self.allowOperatorOverloading:
    self.emit (', null, ')
else:
    self.emit (' (')

self.emit ('{}function', 'async ' if anAsync else '')</t>
<t tx="ekr.20201226145950.1">@nosearch

# flattened, word, ignore-case, head, body

# found 9 nodes</t>
<t tx="ekr.20201226150311.1">for decorator in node.decorator_list:
    decoratorNode = decorator
    decoratorType = type (decoratorNode)
    nameCheck = ''
    while decoratorType != ast.Name:
        if decoratorType == ast.Call:
            decoratorNode = decoratorNode.func
        elif decoratorType == ast.Attribute:
            nameCheck = '.' + decoratorNode.attr + nameCheck
            decoratorNode = decoratorNode.value
        decoratorType = type (decoratorNode)

    nameCheck = decoratorNode.id + nameCheck

    if nameCheck == 'classmethod':
        isClassMethod = True
        getter = '__getcm__'
    elif nameCheck == 'staticmethod':
        isStaticMethod = True
        getter = '__getsm__'
    elif nameCheck == 'property':
        isProperty = True
        nodeName = '_get_' + node.name
        pushPropertyAccessor (nodeName)
    elif re.match ('[a-zA-Z0-9_]+\.setter', nameCheck):
        isProperty = True
        nodeName = '_set_' + re.match ('([a-zA-Z0-9_]+)\.setter', nameCheck).group (1)
        pushPropertyAccessor (nodeName)
    else:
        decorate = True</t>
<t tx="ekr.20201226151328.1">if type (node.decorator_list [-1]) == ast.Name and node.decorator_list [-1] .id == 'dataclass':
    isDataClass = True
    dataClassArgDict = dict (dataClassDefaultArgTuple)              # Use default decorator args (or rather there are no args)
    node.decorator_list.pop ()
elif type (node.decorator_list [-1]) == ast.Call and node.decorator_list [-1] .func.id == 'dataclass':
    isDataClass = True
    dataClassArgDict = {}
    self.visit_Call (node.decorator_list.pop (), dataClassArgDict)   # Adapt dataClassArgDict to decorator args</t>
<t tx="ekr.20201226151343.1">self.emit (' ')
if self.allowOperatorOverloading:
    self.emit ('__call__ (')    # The decorator is called, it may be a ast.Name (paramless) of a function or the result of an ast.Call (with params)

for decorator in node.decorator_list:
    if decoratorsUsed &gt; 0:
        self.emit (' (')
    self.visit (decorator)      # This can either be a ast.Name (paramless dec) or and ast.Call (dec with params)
    decoratorsUsed += 1

if self.allowOperatorOverloading:
    self.emit (', null, ')
else:
    self.emit (' (')</t>
<t tx="ekr.20201226151440.1">
def emitMerges ():
    def emitMerge (merge):
        # Merge dataclass fields for any class, since parents or descendants may be dataclasses
        # ??? Should __bases__ hold complete dotted classnames in case of local classes?
        if merge.isDataClass:
            self.emit ('\nfor (let aClass of {}.__bases__) {{\n', self.filterId (merge.className))
            self.indent ()
            self.emit ('__mergefields__ ({}, aClass);\n', self.filterId (merge.className))
            self.dedent ()
            self.emit ('}}')

            # Merge dataclass fields for current class
            self.emit (';\n__mergefields__ ({}, {{', self.filterId (merge.className))
            self.emit ('__reprfields__: new Set ([{}]), ', ', '.join ('\'{}\''.format (reprAssign.target.id) for reprAssign in merge.reprAssigns))
            self.emit ('__comparefields__: new Set ([{}]), ', ', '.join ('\'{}\''.format (compareAssign.target.id) for compareAssign in merge.compareAssigns))
            self.emit ('__initfields__: new Set ([{}])', ', '.join ('\'{}\''.format (initAssign.target.id) for initAssign in merge.initAssigns))
            self.emit ('}})')

    for merge in self.mergeList:
        emitMerge (merge)

    self.mergeList = []

def emitProperties ():
    def emitProperty (className, propertyName, getterName, setterName = None):
        self.emit ('\nObject.defineProperty ({}, \'{}\', '.format (className, propertyName))
        if setterName:
            self.emit ('property.call ({0}, {0}.{1}, {0}.{2})'.format (className, getterName, setterName))
        else:
            self.emit ('property.call ({0}, {0}.{1})'.format (className, getterName))
        self.emit (');')

    if self.propertyAccessorList:
        self.emit (';')
    while self.propertyAccessorList:
        propertyAccessor = self.propertyAccessorList.pop ()
        className = propertyAccessor.className
        functionName = propertyAccessor.functionName
        propertyName = functionName [5:]
        isGetter = functionName [:5] == '_get_'

        # Find a pair
        for propertyAccessor2 in self.propertyAccessorList:
            className2 = propertyAccessor2.className
            functionName2 = propertyAccessor2.functionName
            propertyName2 = functionName2 [5:]
            isGetter2 = functionName2 [:5] == '_get_'

            if className == className2 and propertyName == propertyName2 and isGetter != isGetter2:
                # Remove pair
                self.propertyAccessorList.remove (propertyAccessor2)
                if isGetter:
                    emitProperty (className, propertyName, functionName, functionName2)
                else:
                    emitProperty (className, propertyName, functionName2, functionName)
                break
        else:
            if isGetter:
                emitProperty (className, propertyName, functionName)
            else:
                raise utils.Error(
                    message='\n\tProperty setter declared without getter\n'
                )</t>
<t tx="ekr.20201226151532.1">if self.isCommentString (statement):
    pass
elif type (statement) in (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef):
    self.emitComma (index, False)
    self.visit (statement)
    index += 1

elif type (statement) == ast.Assign:
    if len (statement.targets) == 1 and type (statement.targets [0]) == ast.Name:
        # LHS is simply a name
        if type (statement.value) == ast.Call and type (statement.value.func) == ast.Name and statement.value.func.id == 'property':
            # Property construction, should be generated after the class
            propertyAssigns.append (statement)
        else:
            # Simple class var assignment, can be generated in-line as initialisation field of a JavaScript object literal
            inlineAssigns.append (statement)
            self.emitComma (index, False)
            self.emit ('\n{}: ', self.filterId (statement.targets [0] .id))
            self.visit (statement.value)
            self.adaptLineNrString (statement)
            index += 1
    else:
        # LHS is attribute, array element or compound destructuring target
        # Has to be generated after the class because it requires the use of an algorithm and can't be initialisation of field of an object literal
        # Limitation: Can't properly deal with line number in this case
        delayedAssigns.append (statement)

elif type (statement) == ast.AnnAssign:
    # An annotated assignment is never a destructuring assignment
    if type (statement.value) == ast.Call and type (statement.value.func) == ast.Name and statement.value.func.id == 'property':
        # Property construction, should be generated after the class
        propertyAssigns.append (statement)
        if isDataClass:
            reprAssigns.append (statement)
            compareAssigns.append (statement)
    elif isDataClass and type (statement.annotation) == ast.Name and statement.annotation.id != 'ClassVar':
        # Possible data class assignment
        inlineAssigns.append (statement)    # For defaults a class var will do
        initAssigns.append (statement)
        reprAssigns.append (statement)
        compareAssigns.append (statement)
        self.emitComma (index, False)
        self.emit ('\n{}: ', self.filterId (statement.target.id))
        self.visit (statement.value)
        self.adaptLineNrString (statement)
        index += 1
    elif type (statement.target) == ast.Name:
        try:
            # Simple class var assignment
            inlineAssigns.append (statement)
            self.emitComma (index, False)
            self.emit ('\n{}: ', self.filterId (statement.target.id))
            self.visit (statement.value)
            self.adaptLineNrString (statement)
            index += 1
        except:
            print (traceback.format_exc ())
    else:
        # LHS is attribute or array element, we can't use it for representation or comparison
        delayedAssigns.append (statement)

elif self.getPragmaFromExpr (statement):
    # It's a pragma
    self.visit (statement)</t>
<t tx="ekr.20201226151714.1"># Deal with data class var assigns, a flavor of special class var assigns
if isDataClass: # Constructor + params have to be generated, no real class vars, just syntactically
    nrOfFragmentsToJump = self.fragmentIndex - initHoistFragmentIndex
    self.fragmentIndex = initHoistFragmentIndex

    originalIndentLevel = self.indentLevel
    self.indentLevel = initHoistIndentLevel

    initArgs = [(
        (
                initAssign.targets [0]
            if type (initAssign) == ast.Assign else
                initAssign.target
        ) .id,
        initAssign.value
     ) for initAssign in initAssigns]

    reprNames = [
    (
        reprAssign.targets [0]
    if type (reprAssign) == ast.Assign else
        reprAssign.target
    ) .id
    for reprAssign in reprAssigns]

    compareNames = [
    (
            compareAssign.targets [0]
        if type (compareAssign) == ast.Assign else
            compareAssign.target
    ) .id
    for compareAssign in compareAssigns]

    # Generate __init__
    if dataClassArgDict ['repr']:
        originalAllowKeywordArgs = self.allowKeywordArgs
        self.allowKeywordArgs = True
        self.visit (ast.FunctionDef (
            name = '__init__',
            args = ast.arguments (
                args = [ast.arg (arg = 'self', annotation = None)],
                vararg = ast.arg (arg = 'args', annotation = None),
                kwonlyargs = [],
                kw_defaults = [],
                kwarg = ast.arg (arg = 'kwargs', annotation = None),
                defaults = []
            ),
            body = [
                ast.Expr (
                    value = ast.Call (
                        func = ast.Name (
                            id = '__pragma__',
                            ctx = ast.Load
                        ),
                        args = [
                            ast.Str (
                                s = 'js'
                            ),
                            ast.Str (
                                s = '{}'
                            ),
                            ast.Str (
                                s = '''
let names = self.__initfields__.values ();
for (let arg of args) {
 self [names.next () .value] = arg;
}
for (let name of kwargs.py_keys ()) {
self [name] = kwargs [name];
}
                                '''.strip ()
                            )
                        ],
                        keywords = []
                    )
                )
            ],
            decorator_list = [],
            returns = None,
            docstring = None
        ))
        self.emit (',')
        self.allowKeywordArgs = originalAllowKeywordArgs

    # Generate __repr__
    if dataClassArgDict ['repr']:
        self.visit (ast.FunctionDef (
            name = '__repr__',
            args = ast.arguments (
                args = [ast.arg (arg = 'self', annotation = None)],
                vararg = None,
                kwonlyargs = [],
                kw_defaults = [],
                kwarg = None,
                defaults = []
            ),
            body = [
                ast.Expr (
                    value = ast.Call (
                        func = ast.Name (
                            id = '__pragma__',
                            ctx = ast.Load
                        ),
                        args = [
                            ast.Str (
                                s = 'js'
                            ),
                            ast.Str (
                                s = '{}'
                            ),
                            ast.Str (
                                s = '''
let names = self.__reprfields__.values ();
let fields = [];
for (let name of names) {{
fields.push (name + '=' + repr (self [name]));
}}
return  self.__name__ + '(' + ', '.join (fields) + ')'
                                '''.strip ()
                            )
                        ],
                        keywords = []
                    )
                )
            ],
            decorator_list = [],
            returns = None,
            docstring = None
        ))
        self.emit (',')

     # Generate comparators   !!! TODO: Add check that self and other are of same class
    comparatorNames = []
    if 'eq' in dataClassArgDict:
        comparatorNames += ['__eq__', '__ne__']
    if 'order' in dataClassArgDict:
        comparatorNames += ['__lt__', '__le__', '__gt__', '__ge__']
    for comparatorName in comparatorNames:
        self.visit (ast.FunctionDef (
            name = comparatorName,
            args = ast.arguments (
                args = [
                    ast.arg (arg = 'self', annotation = None),
                    ast.arg (arg = 'other', annotation = None)
                ],
                vararg = None,
                kwonlyargs = [],
                kw_defaults = [],
                kwarg = None,
                defaults = []
            ),
            body = [
                ast.Expr (
                    value = ast.Call (
                        func = ast.Name (
                            id = '__pragma__',
                            ctx = ast.Load
                        ),
                        args = [
                            ast.Str (
                                s = 'js'
                            ),
                            ast.Str (
                                s = '{}'
                            ),
                            ast.Str (
### Perfect import failed here.
                                s = ('''
let names = self.__comparefields__.values ();
let selfFields = [];
let otherFields = [];
for (let name of names) {
selfFields.push (self [name]);
otherFields.push (other [name]);
}
return list (selfFields).''' + comparatorName + '''(list (otherFields));
                                ''').strip ()   # ... Adding is ugly, repair __pragma__
                            )
                        ],
                        keywords = []
                    )
                )
             ],
            decorator_list = []
        ))
        returns = None,
        self.emit (',')

    # After inserting at init hoist location, jump forward as much as we jumped back
    # Simply going back to the original fragment index won't work, since fragments were prepended
    self.fragmentIndex += nrOfFragmentsToJump

    # And restore indent level to where we were
    self.indentLevel = originalIndentLevel</t>
<t tx="ekr.20201226151908.1"># LHS plays a role in a.o. __repr__ in a dataclass

inlineAssigns = []      # LHS is simple name, class var assignment generates initialisation of field in object literal
propertyAssigns = []    # LHS is simple name, RHS is property constructor call
initAssigns = []        # Dataclass instance var assignment, these are also the params to the generated __init__

# LHS plays no role in a.o. __repr__ in a dataclass

delayedAssigns = []     # LHS is array element, attribute or compound destructuring target, class var assignement generates statement after class object literal

# Assignments whose LHS name is used in __repr__, have to be in ordere encountered,
# so can't be computed by concatenation of &lt;other&gt;VarAssigns

reprAssigns = []       # Representation consists of instance vars, class vars and properties, in the order encountered

# Assignments whose LHS names is used in comparisons, have to be in ordere encountered,
# so can't be computed by concatenation of &lt;other&gt;VarAssigns
# Class vars shouln't be included, as only objects of the same class can be compared.

compareAssigns = []     # Comparing is done by instance vars and properties, in the order encountered</t>
<t tx="ekr.20201227054732.1"></t>
<t tx="ekr.20201227054945.1"></t>
</tnodes>
</leo_file>
