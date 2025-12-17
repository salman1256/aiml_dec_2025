import os
try:
    dir_path=r'C:\Users\salma\OneDrive\Desktop\aiml_dec_2025\Day-6'
    file_name=input('Enter file name with extension to readout from file: ')
    file_path=os.path.join(dir_path,file_name)
    if(os.path.exists(file_path)):
        with open(file_path,'r') as file:
            file_content=file.read()
            print(file_content)
            file.close()
    else:
        print(f'No such file {file_name} exist')        
except Exception as ex:
    print('Error!!! ',ex)  
finally:
    print('End of Program') 