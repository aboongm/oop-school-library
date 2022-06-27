require './student'
require './teacher'
require './book'
require './rental'
require './list_items'
require './create_rental'
require './create_book'
require './create_person'

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
    @persons << CreatePerson.new.create_student(age, name)
  end

  def create_teacher(age, name)
    @persons << CreatePerson.new.create_teacher(age, name)
  end

  def create_person
    @persons << CreatePerson.new.create_person
  end

  def create_book
    @books << CreateBook.new.create_book
  end

  def create_rental
    @rentals << CreateRental.new.create_rental(list_books, list_persons, @persons, @books)
  end

  def list_rentals
    @list_items.show_rentals_list(@rentals, @persons)
  end
end
