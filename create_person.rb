require './student'
require './teacher'

class CreatePerson
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
      create_person
    end
    student
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    puts "The Teacher is created successfuly\n\n"
    teacher
  end
end
