class Player:
    def __init__(self):
        self.id=-1
        self.name=' '

    def register(self):
        self.id=int(input('Enter Player Id:\t '))  
        self. name=input('Enter Player name:\t')  

    def  __str__(self):
        return f'Id:{self.id} Name: {self.name}'   
    

p1=Player() 
p1.register()  
print(p1)   

#Create a LibraryBook class to manage book details and issue status.
# 1. Create class LibraryBook
# 2. Constructor to take book_name, book_author ,is_issued=False
# 3. Create following Methods 
# show_details(): display book information
# issue_book() : mark book as issued ( is_issued=True)
# return_book(): mark book as returned (is_issued=False)

# Create at least one object and call methods