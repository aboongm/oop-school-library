require './app'

class Start
  def initialize
    @app = App.new
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_input(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_persons
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thank you for using School Library App'
      exit
    else
      puts 'Please select an option'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def run
    loop do
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
  end
end

