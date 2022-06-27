class ListItems
  def show_books_list(books)
    puts "\nList of Books: "
    puts 'There is no book in the list. Please add a book!' if books.length.zero?
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts "\n"
  end
end
