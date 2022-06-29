require_relative '../teacher'

describe 'Teacher' do
  before(:each) do
    @teacher = Teacher.new(34, 'Physics', 'John')
  end

  it 'Should take the age, the specialization, and the name' do
    expect(@teacher.age).to eq(34)
    expect(@teacher.specialization).to eq('Physics')
    expect(@teacher.name).to eq('John')
  end

  it 'Should take the age' do
    new_teacher = Teacher.new(28, 'Physics')
    expect(new_teacher.age).to eq(28)
    expect(new_teacher.specialization).to eq('Physics')
    expect(new_teacher.name).to eq('unknown')
  end

  it 'Should return true if the age is greater than or equal to 18' do
    new_teacher = Teacher.new(45, 'Physics', 'Bob')
    expect(new_teacher.can_use_services).to eq(true)
  end
end
