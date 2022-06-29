require './classroom'
require './student'

describe 'ClassRoom' do
  context 'Classroom Test When ' do
    it 'should be able to create a classroom' do
      classroom = Classroom.new('A')
      expect(classroom.label).to eq('A')
      expect(classroom.students).to eq([])
    end

    it 'should be able to add a student to a classroom' do
      classroom = Classroom.new('A')
      student = Student.new('A')
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end

    it 'should be able to add multiple students to a classroom' do
      classroom = Classroom.new('A')
      student1 = Student.new('A')
      student2 = Student.new('B')
      classroom.add_student(student1)
      classroom.add_student(student2)
      expect(classroom.students).to eq([student1, student2])
    end
  end
end
