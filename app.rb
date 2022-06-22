require './book'

class App
  # list all books
  # list all people
  # create a person (teacher or student)
  # create a book
  # create a rental
  # list all rentals for a given person id

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
    else
      puts 'Please select an option'
      ui_input
    end
  end

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
