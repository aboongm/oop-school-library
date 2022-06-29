require './trimmer_decorator'
require './person'

describe TrimmerDecorator do
  context 'Trimmer Decorator Test When ' do
    it 'should be able to create a trimmer decorator' do
      person = Person.new(20, 'Thesectionthatbeginswiththe')
      trimmer = TrimmerDecorator.new(person)
      expect(trimmer.correct_name).to eq('Thesection')
    end
  end
end
