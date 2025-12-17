#FileHandling 'w'-writing , 'r'->reading 'a'-append ,r+ 'read & write'
import os
try:
    # filepath='C:\\Users\\salma\\OneDrive\\Desktop\\aiml_dec_2025\\Day-7\\ourfiles\\sample.txt'
    filepath=r'C:\Users\salma\OneDrive\Desktop\aiml_dec_2025\Day-7\ourfiles\sample.txt'
    file=open(filepath,'w')
    content=input('Enter Text to Write in file')
    file.write(content)
    print('Text written in file and saved')
    file.close()
except Exception as ex:
    print('Error!!! ',ex)  
finally:
    print('End of Program')      