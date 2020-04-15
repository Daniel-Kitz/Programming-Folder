
#function declaration
def collatz(number):
        #looks if the number is odd or even
        if number % 2 == 0:

                number = number//2
                print(number)
                return number
                #returns the numbervalue as functionvalue afterwards
        else:
                number = 3*number+1
                print(number)
                return number



try:
        userInput = int(input('Please enter a number: '))

except ValueError:
        print('Please enter a valid INTEGER')



while userInput != 1:
        userInput = collatz(userInput)
    
    
        