# import os
# folder_name=input('Enter folder name to create folder: ')
# if(os.path.exists(folder_name)):
#     print('Folder already exist')
# else:
#     os.mkdir(folder_name)
#     print('Folder Created')    

# file_name=input('Enter file name (with extension)')
# file_path=os.path.join(folder_name,file_name)
# if(os.path.exists(file_path)):
#     print('File Alread exist')

# else:
#     text_to_write=input('Enter text to write in file')
#     with open(file_path,'w') as file:
#         file.write(text_to_write)
#         print('File Created!!!')

# import datetime
# print(datetime.date.today().strftime('%d-%m-%y'))

#Write a program in python for Students Project
 # 1. Take student name
 # 2. Creates a student folder with studentname (if not exist)
 # 3. Asks for project title
 # 4. Creates project.txt inside the folder and Writes following detials in file

 # Student Name
 # Project Title
 # Current Date     Hint:  datetime.date.today().strftime('%d-%m-%y')
