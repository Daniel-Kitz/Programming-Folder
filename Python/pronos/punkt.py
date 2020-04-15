myList = []
word = 'Nike'
newString = ''


for i in word:
    myList.append(i)
    print(myList)

for n in myList:
    if n != myList[-1]:
        newString += n 
        newString += '.'
    else:
        newString +=n
        print(newString)
