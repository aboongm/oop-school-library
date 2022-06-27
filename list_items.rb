class ListItems
  def show_books_list(books)
    puts "\nList of Books: "
    puts 'There is no book in the list. Please add a book!' if books.length.zero?
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts "\n"
  end

  def show_persons_list(persons)
    puts "\nList of Persons: "
    puts 'There is no one in the list. Please add a person!' if persons.length.zero?
    persons.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "[Student] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
      else
        puts "[Teacher] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
      end
    end
    puts "\n"
  end

  def show_rentals_list(rentals, persons)
    puts "\nID of the Person: "
    show_persons_list(persons)
    id = gets.chomp.to_i
    puts 'List of Rentals: '
    puts 'There is no rental in the list. Please add a rental!' if rentals.length.zero?
    rentals.each do |rental|
      puts "Date: #{rental.date}. Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    puts "\n"
  end
end
