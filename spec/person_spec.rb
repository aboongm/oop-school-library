require_relative '../person'

describe 'Person' do
    before(:each) do
        @person = Person.new(34, "John", parent_permission: true)
    end

    it 'Should take the age, the name, and the parent_permission' do
        expect(@person.age).to eq(34)
        expect(@person.name).to eq("John")
        expect(@person.parent_permission).to eq(true)
    end

    it "Should take the age" do
        new_person = Person.new(28)
        expect(new_person.age).to eq(28)
        expect(new_person.name).to eq("Unknown")
        expect(new_person.parent_permission).to eq(true)
    end

    it "Should return true if the age is greater than or equal to 18" do
        new_person = Person.new(15, "John", parent_permission: false)
        expect(new_person.can_use_services).to eq(false)
    end

    it "Should return true if the age is greater than or equal to 18" do
        new_person = Person.new(19, "John", parent_permission: false)
        expect(new_person.can_use_services).to eq(true)
    end

    it "Should return true when correct_name method is called" do
        new_person = Person.new(29, "John", parent_permission: true)
        expect(new_person.correct_name).to eq("John")
        expect(new_person.correct_name).not_to eq("Johnhhhh")
    end
end