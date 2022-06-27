require_relative 'rental'

class CreateRental
  def list_book(list_books)
    list_books
  end

  def list_person(list_persons)
    list_persons
  end

  def create_rental(list_books, list_persons, persons, books)
    print "\nSelect a book from the following list by number: "
    list_book(list_books)
    book_index = gets.chomp.to_i

    print 'Select a person from the following list by number (not id): '
    list_person(list_persons)
    person_index = gets.chomp.to_i

    print 'Enter a date [format yyyy/mm/dd]: '
    date = gets.chomp

    rental = Rental.new(date, persons[person_index - 1], books[book_index - 1])
    # @rentals << rental
    puts "Rental created successfully\n\n"
    rental
  end
end
