import os
try:
    dir_path=r'C:\Users\salma\OneDrive\Desktop\aiml_dec_2025\Day-7\ourfiles'
    file_name=input('Enter file name to update the file: \t')
    file_path=os.path.join(dir_path,file_name)
    if(os.path.exists(file_path)):
        file=open(file_path,'a')
        file_content=input('Enter text to update file ')
        file.write(file_content)
        print(f'file {file_name} update')
        file.close()
    else:
        print(f'No such file {file_name} exist @ {dir_path}')    

except Exception as ex:
    print('Error Occured ',ex)

finally:
    print('End of Program')
