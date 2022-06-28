require './student'
require './teacher'
require './rental'

module SaveData
  def save_data(books, persons, rentals)
    save_books(books)
    save_persons(persons)
    save_rentals(rentals)
  end

  def save_books(books)
    saved_books = []
    books.each do |book|
      saved_books << {
        title: book.title,
        author: book.author
      }
    end
    ruby = JSON.generate(saved_books)
    File.write('./data/books.json', ruby)
  end

  def save_persons(persons)
    saved_persons = []
    puts "person: #{persons}"
    persons.each_with_index do |person, index|
        puts "index: #{index} - person: #{person}"
        saved_persons << if person.instance_of? Student
                         {
                           json_class: 'Student',
                           name: person.name,
                           age: person.age,
                           parent_permission: person.parent_permission
                         }
                       elsif person.instance_of? Teacher
                         {
                           json_class: 'Teacher', name: person.name, age: person.age, specialization: person.specialization
                         }
                       end
    end
    ruby = JSON.generate(saved_persons)
    File.write('./data/persons.json', ruby)
  end

  def save_rentals(rentals)
    data = []
    rentals.each do |rental|
      data << {
                  date: rental.date,
                  person_id: rental.person.id,
                  name: rental.person.name,
                  title: rental.book.title,
                  author: rental.book.author
                }
    end
    ruby = JSON.generate(data)
    File.write('./data/rentals.json', ruby)
  end
end
