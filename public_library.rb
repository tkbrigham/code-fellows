class Library
  def initialize(shelves = [])
    @shelves = shelves
  end

  def add_shelves(*shelves)
    shelves.each do |shelf|
      @shelves << shelf
    end
  end

  def all_books
    puts "All Library Books:"
    @shelves.each do |shelf|
      shelf.books
    end
  end
end

class Shelf
  def initialize(shelf_name, books = [])
    @shelf_name = shelf_name
    @books = books
  end

  def add_books(*books)
    books.each do |book|
      @books << book
    end
  end

  def remove_books(*books)
    books.each do |test_book|
      answer = @books.select do |existing_book|
        test_book == existing_book
      end
      @books -= answer
    end
  end

  def books
    puts "  Books in #{@shelf_name} shelf:"
    @books.each do |book|
      book.display
    end
  end
end

class Book
  attr_reader :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end

  def display
    puts "    Title: #{@title}, Author: #{@author}"
  end
end

puts "Instantiating Library"
l = Library.new

puts "Instantiating Shelves"
s1 = Shelf.new("First Row")
s2 = Shelf.new("Second Row")
s3 = Shelf.new("Third Row")

puts "Instantiating Books"
b1 = Book.new("First Book", "First Author")
b2 = Book.new("Second Book", "Second Author")
b3 = Book.new("Third Book", "Second Author")
b4 = Book.new("Fourth Book", "Third Author")
b5 = Book.new("Fifth Book", "Third Author")
b6 = Book.new("Sixth Book", "Third Author")
b7 = Book.new("Seventh Book", "Fourth Author")
b8 = Book.new("Eighth Book", "Fourth Author")
b9 = Book.new("Ninth Book", "Fourth Author")
b10 = Book.new("Tenth Book", "Fourth Author")


puts "Adding shelves to library"
l.add_shelves(s1, s2, s3)

puts "Adding books to shelves"
s1.add_books(b1, b4, b5, b6)
s2.add_books(b2, b3)
s3.add_books(b7, b8, b9, b10)

puts "--------------------- \nPutting library"
l.all_books

puts "--------------------- \ns1 before delete"
s1.books

book_to_delete = b4
puts "deleting: #{book_to_delete.inspect}"
s1.remove_books(book_to_delete)

puts "s1 after delete"
s1.books

puts "new library:"
l.all_books
