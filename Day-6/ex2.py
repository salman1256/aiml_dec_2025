# import inspect
# import math
# functions=inspect.getmembers(math,inspect.isbuiltin)
# for name,func in functions:
#     print(name,end='\t')

# print('\n --------------------------------------\n')
# print('Floor of 3.45',math.floor(3.45))
# print('Ceil of 3.45',math.ceil(3.45))
#-------------------------------------------------------------
# Create Room Flooring Cost Calculator (using math module)
# You want to install square tiles in room
# Room size is length* width (4.6 *3.2)
# cost per tile is 2 
# Each tile cover 1 square meter 
# Calculate total tiles needed (You must use ceiling to round of the tiles, because we can't buy parts of tiles )
# Calculate total cost as well
import math
length=float(input('Enter length of room in meters:\t'))
width=float(input('Enter width of room in meters:\t '))
cost_per_tile=float(input('Enter Cost per tile:\t'))
room_area=length*width
tiles_needed=math.ceil(room_area)
total_cost=tiles_needed*cost_per_tile
print('All Information as follows')
print('Room area: ',room_area,'square meter')
print('Tiles needed: \t',tiles_needed)
print('Cost per tile in RM: \t',cost_per_tile)
print('Total Cost in RM: \t',total_cost)
