#! python3
# ListCreator.py - Makes a dotted list from your clipboard.

import pyperclip

text = pyperclip.paste()

#separete lines and add stars.
lines = text.split('\n')
for i in range(len(lines)): #goes through all the lines
    lines[i] = '* ' + lines[i] #changes the list items accordingly
text = '\n'.join(lines) #adds list item to string separated by a linebreak
pyperclip.copy(text) #copies to clipboard
print('Your listed list was now added to your clipboard!')