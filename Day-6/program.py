# import OurFolder.greet as greet
# user_name=input('Enter your name: ')
# print(greet.welcome(user_name))

# print(greet.bye(user_name))

# import OurFolder.greet as g
# import dicegame as dice
# player_name=input('Enter your name')
# g.welcome(player_name)
# player_roll=dice.roll_dice()
# print('You got:\t',player_roll)
# computer_roll=dice.roll_dice()
# print('Computer got:\t',computer_roll)
# result=dice.check_result(player_roll,computer_roll)
# print(result)
# Create a program using custom Python module that check a person's age and tells their category
#Takes age as input from user
# Display the category to the user
# Use seprate module to decide age category, age categories as follows
  # 1. Child    below 13
  # 2. Teenager  13 to 18
  # 3. Adult     19 to 59
  # 4. Senior Citizen 60 and above 
    
#from package.module import function
from calculator.add import addition 
from calculator.sub import subtraction
from calculator.div import division

first_number=int(input('First Number: '))
second_number=int(input('Second Number: '))
print(f'Result after adding {first_number} and {second_number}',addition(first_number,second_number))
print(f'Result after subtracting  {second_number} from {first_number}',subtraction(first_number,second_number))

print(f'Result after dividing {first_number} by {second_number}',division(first_number,second_number))
  