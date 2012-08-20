<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ville.20120817104907.1695"><vh>Instructions</vh></v>
<v t="ville.20120817104907.1683"><vh>Simple test</vh></v>
<v t="ville.20120817104907.1688" a="E"><vh>leo walker</vh>
<v t="ville.20120817104907.1689" a="E"><vh>@file write_leo_file.py</vh></v>
</v>
<v t="ville.20120817104907.1699" a="E"><vh>@path /tmp</vh>
<v t="ville.20120817104907.1691" a="E"><vh>@spreadsheet testspread.xls</vh>
<v t="ville.20120817104907.1684" a="E"><vh>heading</vh>
<v t="ville.20120817104907.1685"><vh>cell to add</vh></v>
<v t="ville.20120817104907.1694"><vh>single line content holder</vh></v>
<v t="ville.20120817104907.1686"><vh>another cell to add</vh></v>
</v>
<v t="ville.20120817104907.1696"><vh>heading 2</vh>
<v t="ville.20120817104907.1697"><vh>more</vh></v>
</v>
<v t="ville.20120817104907.1698"><vh>cells</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ville.20120817104907.1683">@language python

import xlwt
from datetime import datetime

font0 = xlwt.Font()
font0.name = 'Times New Roman'
font0.colour_index = 2
font0.bold = True

style0 = xlwt.XFStyle()
style0.font = font0

style1 = xlwt.XFStyle()
style1.num_format_str = 'D-MMM-YY'

wb = xlwt.Workbook()
ws = wb.add_sheet('A Test Sheet')

ws.write(0, 0, 'Test', style0)
ws.write(1, 0, datetime.now(), style1)
ws.write(2, 0, 1)
ws.write(2, 1, 1)
ws.write(2, 2, xlwt.Formula("A3+B3"))

wb.save('example.xls')

g.os_startfile("example.xls")
</t>
<t tx="ville.20120817104907.1684"></t>
<t tx="ville.20120817104907.1685">Many lines of content,line 2

Lots  of content for the cell
</t>
<t tx="ville.20120817104907.1686">More detailed content

and latter line
</t>
<t tx="ville.20120817104907.1688"></t>
<t tx="ville.20120817104907.1691"></t>
<t tx="ville.20120817104907.1694">Bunch of content in body, on single line
</t>
<t tx="ville.20120817104907.1695">On ubuntu, install python-xlwt (excel write libary)
press ctrl+b on write_leo_file.py below

Mechanism: 

</t>
<t tx="ville.20120817104907.1696"></t>
<t tx="ville.20120817104907.1697"></t>
<t tx="ville.20120817104907.1698"></t>
<t tx="ville.20120817104907.1699"></t>
</tnodes>
</leo_file>
