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
    
  end

  def save_rentals(rentals)
    
  end
end
