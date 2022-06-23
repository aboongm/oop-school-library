require './app'

def main()
  app = App.new
  puts "Welcome to School Library App\n\n"
  puts 'Please choose an option by entering a number:'
  puts '1. list all books'
  puts '2. list all people'
  puts '3. create a person (teacher or student)'
  puts '4. create a book'
  puts '5. create a rental'
  puts '6. list all rentals for a given person id'
  puts '7. Exit'

  option = gets.chomp.to_i
  app.handle_input(option)
end

main
