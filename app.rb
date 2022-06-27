require './student'
require './teacher'
require './book'
require './rental'
require './list_items'
require './create_rental'
require './create_book'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
    @list_items = ListItems.new
  end

  def list_books
    @list_items.show_books_list(@books)
  end

  def list_persons
    @list_items.show_persons_list(@persons)
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
    @books << CreateBook.new.create_book
  end

  def create_rental
    @rentals << CreateRental.new.create_rental(list_books, list_persons, @persons, @books)
  end

  def list_rentals
    # puts "\nID of the Person: "
    # list_persons
    # id = gets.chomp.to_i
    # puts 'List of Rentals: '
    # if @rentals.length.zero?
    #   puts 'There is no rental in the list. Please add a rental!'
    # else
    #   @rentals.each do |rental|
    #     puts "Date: #{rental.date}. Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    #   end
    # end
    # puts "\n"
    @list_items.show_rentals_list(@rentals, @persons)
  end
end
