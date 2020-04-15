#! python3

# pw.py - The securest password locker programm ever made!

import sys
import pyperclip

passwords = {'email': '1234qwerasdf', 
             'blog': 'asjdkalsfkjfk',
             'luggage': '1234'}

if len(sys.argv) < 2:
    print('Usage: python pw.py [account] - copies the password for a certain account')
    sys.exit()

account = sys.argv[1]

if account in passwords:
    pyperclip.copy(passwords[account])
    print('Password of ' + account + ' copied to clipboard')
else:
    print('There is no account named: ' + account)
