# import os
# from datetime import datetime
# try:
#     dir_path=os.getcwd()
#     folder_name=input('Enter folder name to store notes: ')
#     folder_path=os.path.join(dir_path,folder_name)
#     if(os.path.exists(folder_path)):
#         print(f'Folder: {folder_name} already exist')
#     else:
#         os.mkdir(folder_path)
#         print('Folder Created')
#     filename=input('Enter your file name: ')
#     file_path=os.path.join(folder_path,filename)
#     text_to_write=input('Enter note to write in file: ')
#     timestamp=datetime.now().strftime('%d-%m-%Y %H:%M')
#     with open(file_path,'w') as file:
#         file.write(f'[{timestamp}: {text_to_write}]')
#     print('Text Saved in File')    

# except Exception as ex:
#     print('Error!!!',ex)
# finally:
#     print('End of Program')

#Create a program for following (for same folder ournotes and same file pythonnotes.txt)
  # create a notes Manager that do the following things
  # 1. Read Notes
  # 2. Add Notes
  # 3. Exit
  #   
import os
from datetime import datetime
file_path=r'C:\Users\salma\OneDrive\Desktop\aiml_dec_2025\Day-7\ournotes\pythonnotes.txt'
while True:
    print('1.Read Notes')
    print('2.Add Notes')
    print('3.Exit')
    choice=int(input('Enter Choice: \t'))
    if choice==1:
        if(os.path.exists(file_path)):
            print('\n All Notes as follows: \n')
            with open(file_path,'r') as file:
                print(file.read())
        else:
            print('No such file exist') 
    elif choice==2:
        new_note=input('Enter note')
        timestamp=datetime.now().strftime('%d-%m-%Y %H:%M')
        with open(file_path,'a') as file:
                file.write(f'\n[{timestamp}: {new_note}]')
        print('New note updated successfully') 
    elif choice==3:
         print('Exiting from Program Bye')
         break 
    else:
         print('Invalid choice')          






