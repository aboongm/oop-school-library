require_relative 'book'

class CreateBook
  def create_book
    print "\nEnter a book title: "
    title = gets.chomp
    print 'Enter a book author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    puts "The book is created successfuly\n\n"
    new_book
  end
end
