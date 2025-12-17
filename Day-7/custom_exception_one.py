# class InvalidAge(Exception):
#     pass

# def check_age(age):
#     if(age<=0):
#         raise InvalidAge('Age should not be negative or zero')
#     elif(age<18):
#         raise InvalidAge('Age should be grater than 18 years')
#     elif(age>=150):
#         raise InvalidAge('Unreal age for a living person')
#     else:
#         print(f'Age: {age} is valid for voting and saved in database')

# try:
#     user_age=int(input('Enter your age:\t'))
#     check_age(user_age)
# except InvalidAge as ex:
#     print('Invalid Age: ',ex) 
# except Exception as ex:
#     print('Exception Occured: ',ex)
#----------------------------------------------------------------------------------------
# Write one example of Custom Exception 
# Take the salary from user 
# if salary is with in range of (2000 to 25000) ,It is allowed.
# If Salary is not within the range than raise a custom exception salary must be within range RM (2K to 25K) 
#
class SalaryNotInRange(Exception):
    pass

def check_salary(salary):
    if (not 2000<salary<25000):
        raise SalaryNotInRange('Salary must be within range RM (2K to 25K)')
    else:
        print(f'Salary {salary} saved and accepted')

try:
    emp_salary=int(input('Enter your Salary:\t'))
    check_salary(emp_salary)
except SalaryNotInRange as ex:
    print('Invalid Salary: ',ex) 
except Exception as ex:
    print('Exception Occured: ',ex) 
finally:
    print('End of Program!!!')       

       

