
# pw.py - An insecure password locker program.
passwords = {}

print('please type the profile you want to copy the password for or type ? to get help')

while True:
 
    m = input()

    if m.startswith('?'):

        splitted_m = m.split()

        if len(splitted_m) > 1:

            if splitted_m[1] == 'copy':
                print('type: copy <profilename> to copy the password for the given profile')
        
            elif splitted_m[1] == 'add': 
                print('unfortunately this version of passwords.py does not provide this feature. Keep on updating this app! Soon this feature will be added')
        
            elif splitted_m[1] == 'list' or splitted_m[1] == 'ls':
                print('lists all currently avaliable profiles')
        
            elif splitted_m[1] == 'admin':
                print('allows you to acces admin mode')
        
            elif splitted_m[1] == 'xray':
                print('Lets you see all the profiles with passwords. Only avaliable with admin mode enabled!')

        else: 
            print('currently avaliable commands: copy, add, list, admin, xtray. For more informatuin type: ? <commmand>')

    elif m.startswith('copy'):
        
        splitted_m = m.split()
        
        #if len(splitted_m) > 1:

        print('please use copy <profile name> to copy a password. Type list to see all avaliable profiles.')

    elif m.startswith('add'):
        print('unfortunately this function does not exist as of rigth now. Use ? add to see more information.')
    
    elif m.startswith('list'):
        
        for k, v in passwords:
            print (k.ljust(5, '_') + v.rjust())

