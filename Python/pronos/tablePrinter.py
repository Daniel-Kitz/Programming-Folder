

tableData = [['apples', 'oranges', 'cherries', 'banana'],
             ['Alice', 'Bob', 'Carol', 'David'],
             ['dogs', 'cats', 'moose', 'goose']]

colwidth = []

for i in tableData:
    for x in tableData[i]:
        colwidth[i] += len(x)
if colwidth[1] < colwidth[2] < colwidth[3]:
    
    
