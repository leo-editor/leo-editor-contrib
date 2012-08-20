#@+leo-ver=5-thin
#@+node:ville.20120817104907.1689: * @file write_leo_file.py
#@@language python

#@+others
#@+node:ville.20120817104907.1690: ** Script to add to your documents
import xlwt
import os

@g.command("spreadsheet")
def spreadsheet_f(event):
    """ Parse @spreadsheet foo.xls directives """
    c = event['c']
    write_spreadsheets(c)


def write_spreadsheets(c):
    
    wb = xlwt.Workbook()
    
    font0 = xlwt.Font()
    font0.name = 'Times New Roman'
    #font0.colour_index = 2
    font0.bold = True
    
    style0 = xlwt.XFStyle()
    
    style1 = xlwt.XFStyle()
    style1.font = font0
        
    ws = wb.add_sheet('Leo dump')
    
    roots = c.find_h("@spreadsheet.*")
    for root in roots:
        parts = root.h.split(None,1)
        if len(parts) == 2:
            fname = parts[1]
            pth = c.getNodePath(root)
            fname = pth + "/" + fname
        #fname ='leo_test.xls'
        g.es("Spreadsheet: " + fname)
        
        row = 0
        
        for n in root.subtree():    
            
            h = n.h
            if h.startswith("@col"):             
                ws.write(row, col, n.b)
                col+=1
                continue
                
                
            col = 2
            row += 1
                
                
            
            if n.v.children:
        
                ws.write(row, 0, n.h,style1)
            else:
                ws.write(row, 0, n.h, style0)
            ws.write(row, 1, n.b.strip())
            
            
        
        #if os.path.exists(
        #os.remove(fname)
        
        wb.save(fname)
        g.es("Wrote " + fname)
        
        g.os_startfile(fname)

write_spreadsheets(c)
#@-others
#@-leo
