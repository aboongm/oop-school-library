require './student'
require './teacher'
require './rental'
require './person'

module LoadData
  def load_books
    if File.exist?('./data/books.json')
      saved_books = JSON.parse(File.read('./data/books.json'))
      books = []
      saved_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
      books
    else
      File.write('./data/books.json', [])
    end
  end

  def load_persons
    if File.exist?('./data/persons.json')
      saved_persons = JSON.parse(File.read('./data/persons.json'))
      persons = []

      saved_persons.each do |person|
        persons << case person['json_class']
                   when 'Student'
                     Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
                   when 'Teacher'
                     Teacher.new(person['age'], person['specialization'], person['name'])
                   end
      end

      persons
    else
      File.write('./data/persons.json', [])
    end
  end

  def load_rentals(persons, books)
    if File.exist?('./data/rentals.json')
      saved_rentals = JSON.parse(File.read('./data/rentals.json'))
      rentals = []
      saved_rentals.each do |rental|
        rentals << Rental.new(rental['date'], persons.find do |person|
                                                person.name == rental['name']
                                              end, books.find do |book|
                                                     book.title == rental['title']
                                                   end)
      end
      rentals
    else
      File.write('./data/rentals.json', [])
    end
  end
end
