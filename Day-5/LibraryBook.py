class LibraryBook:
    def __init__(self,book_name, book_author ,is_issued=False):
       self.book_name=book_name
       self.book_author=book_author
       self.is_issued=is_issued
    def show_details(self):
        print('Book Name: \t',self.book_name) 
        print('Book Author: \t',self.book_author) 
        print('Is Book Issued ?',self.is_issued) 

    def issue_book(self):
        self.is_issued=True 

    def return_book(self):
        self.is_issued=False     
book1=LibraryBook('Harry Potter','JK Rowling')
book1.show_details()
book1.issue_book()
print('After issuing book')
book1.show_details()  

book1.return_book()
print('After retruning book')
book1.show_details()    