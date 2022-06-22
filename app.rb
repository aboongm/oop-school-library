require './student'
require './teacher'
require './book'
require './rental'

class App
  # list all books
  def list_books
    puts "\nList of Books: "
    if @books.length.zero?
        puts 'There is no book in the list. Please add a book!'
    else
        @books.each_with_index do |book, index|
            puts "#{index + 1}. #{book.title} by #{book.author}"
        end
    end
    puts "\n"
  end

  # list all people
  def list_persons
    puts 'list persons'
  end

  # create a person (teacher or student)
  def create_person
    puts 'create persons'    
  end

  # create a book
  def create_book
    print 'Enter a book title: '
    title = gets.chomp
    print 'Enter a book author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'The book is created successfuly'
  end

  # create a rental
  def create_rental
    puts 'create rental'
  end

  # list all rentals for a given person id
  def list_rentals
    puts 'list rentals'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_input(option)
    case option
    when 1
      list_books
    when 2
      list_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using School Library App'
      exit
    else
      puts 'Please select an option'
    end
    ui_input
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def ui_input
    puts 'Please choose an option by entering a number:'
    puts '1. list all books'
    puts '2. list all people'
    puts '3. create a person (teacher or student)'
    puts '4. create a book'
    puts '5. create a rental'
    puts '6. list all rentals for a given person id'
    puts '7. Exit'

    option = gets.chomp.to_i
    handle_input(option)
  end

  def run
    @books = []
    @persons = []
    puts "Welcome to School Library App\n\n"
    ui_input
  end
end
