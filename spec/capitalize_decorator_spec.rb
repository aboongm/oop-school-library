require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  context 'When testing decorator classes' do
    it 'Should return a string capitalized' do
      person = Person.new(22, 'maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq 'Maximilianus'
    end
  end
end
