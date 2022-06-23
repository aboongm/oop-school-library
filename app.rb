require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

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

  def list_persons
    puts "\nList of Persons: "
    if @persons.length.zero?
      puts 'There is no one in the list. Please add a person!'
    else
      @persons.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "[Student] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
        else
          puts "[Teacher] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
        end
      end
    end
    puts "\n"
  end

  def create_student(age, name)
    print 'Parent Permission [y/n]: '
    parent_permission = gets.chomp
    case parent_permission
    when 'y'
      student = Student.new(age, name)
      puts "The Student is created successfuly\n\n"
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      puts "The Student is created successfuly\n\n"
    else
      puts 'Invalid input! Please try again'
      ui_input
    end
    @persons << student
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts "The Teacher is created successfuly\n\n"
  end

  def create_person
    print "\nDo you want to create Student (1) or Teacher (2)? [Input the number]: "
    person_type = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case person_type
    when 1
      create_student(age, name)
    when 2
      create_teacher(age, name)
    else
      puts 'Invalid input! Type a valid input (1 or 2)'
    end
  end

  def create_book
    print "\nEnter a book title: "
    title = gets.chomp
    print 'Enter a book author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "The book is created successfuly\n\n"
  end

  def create_rental
    print "\nSelect a book from the following list by number: "
    list_books
    ui_input if @books.length.zero?
    book_index = gets.chomp.to_i

    print 'Select a person from the following list by number (not id): '
    list_persons
    ui_input if @persons.length.zero?
    person_index = gets.chomp.to_i

    print 'Enter a date [format yyyy/mm/dd]: '
    date = gets.chomp

    rental = Rental.new(date, @persons[person_index - 1], @books[book_index - 1])
    @rentals << rental
    puts "Rental created successfully\n\n"
  end

  def list_rentals
    puts "\nID of the Person: "
    list_persons
    ui_input if @persons.length.zero?
    id = gets.chomp.to_i
    puts 'List of Rentals: '
    if @rentals.length.zero?
      puts 'There is no rental in the list. Please add a rental!'
    else
      @rentals.each do |rental|
        puts "Date: #{rental.date}. Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
      end
    end
    puts "\n"
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
    puts "Welcome to School Library App\n\n"
    ui_input
  end
end
