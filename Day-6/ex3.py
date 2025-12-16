# import random
# # import inspect
# # print(dir(random))
# print(random.randint(1,10))  #return random integer in range [a, b], including both end points.

import datetime

# print('Today (Date): \t',datetime.date.today())
# print('Date Time: \t',datetime.datetime.now())

# today=datetime.date.today()
# print('Complete date:\t',today)
# print('year:\t',today.year)
# print('month:\t',today.month)
# print('day\t',today.day)

# t=datetime.time(12,15,45)
# print(t)
# print('Hour : \t',t.hour)
# print('Minute: \t',t.minute)
# print('Second: \t',t.second)

# current_time=datetime.datetime.now().time()
# print('Current Time: \t',current_time)
# print('Current System Time in HH: MM: SS',current_time.strftime('%H:%M:%S'))
# print('Time in 12 Hours format: \t',current_time.strftime('%I:%M:%S %p'))
#----------------------------------------------------------------------------------------
import os
# print(dir(os))
current_dir=os.getcwd()
print('Current Directory: \t',current_dir)
all_files=os.listdir()
print('All Files: \t',all_files)
print('All Files')
for file in all_files:
    print(file)


