import re
def check_pwd(password):
    length_rule=len(password)>=8
    uppercase_rule=re.search(r'[A-Z]',password)
    number_rule=re.search(r'[0-9]',password)
    special_rule=re.search(r'[!@#$%^&*]',password)
    if(length_rule and uppercase_rule and number_rule and special_rule):
        print('Strong Password')
    else:
        print('Weak Password')
        print('Password must contain')  
        print('at least 8 characters') 
        print('One uppercase letter') 
        print('One number')
        print('And one special character !@#$%^&*')
