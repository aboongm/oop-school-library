require_relative '../student'

describe 'Student' do
  before(:each) do
    @student = Student.new(34, 'John', parent_permission: true)
  end

  it 'Should take the age, the name, and the parent_permission' do
    expect(@student.age).to eq(34)
    expect(@student.name).to eq('John')
    expect(@student.parent_permission).to eq(true)
  end

  it 'Should take the age' do
    new_student = Student.new(28)
    expect(new_student.age).to eq(28)
    expect(new_student.name).to eq('Unknown')
    expect(new_student.parent_permission).to eq(true)
  end

  it "Should return ¯\(ツ)/¯" do
    new_student = Student.new(28, 'John', parent_permission: true)
    expect(new_student.play_hooky).to eq("¯\(ツ)/¯")
  end
end
