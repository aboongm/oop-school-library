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
    persons.each_with_index do |person, _index|
      saved_persons << if person.instance_of? Student
                         {
                           json_class: 'Student',
                           id: person.id,
                           name: person.name,
                           age: person.age,
                           parent_permission: person.parent_permission
                         }
                       elsif person.instance_of? Teacher
                         {
                           json_class: 'Teacher',
                           id: person.id,
                           name: person.name,
                           age: person.age,
                           specialization: person.specialization
                         }
                       end
    end

    File.write('./data/persons.json', JSON.generate(saved_persons))
  end

  def save_rentals(rentals)
    data = []
    rentals.each do |rental|
      data << {
        date: rental.date,
        id: rental.person.id,
        name: rental.person.name,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('./data/rentals.json', JSON.generate(data))
  end
end
