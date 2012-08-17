#@+leo-ver=5-thin
#@+node:ville.20120817104907.1689: * @file write_leo_file.py
#@@language python

#@+others
#@+node:ville.20120817104907.1690: ** content
import xlwt
import os


wb = xlwt.Workbook()

ws = wb.add_sheet('Leo dump')

root = c.find_h("@spreadsheet.*")

#fname ='leo_test.xls'
g.es( root)

p = root[0]

row = 0

for n in p.subtree():    
    col=n.level()
    ws.write(row, col, n.h)
    ws.write(row, col+1, n.b.lstrip())
    row += 1

os.remove("example.xls")

wb.save('example.xls')

g.os_startfile("example.xls")
    
g.es(n)
    
    

#@-others
#@-leo
