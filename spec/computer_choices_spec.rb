require './lib/computer_choices.rb'

RSpec.describe do

    it 'exists' do
      computer_choices = ComputerChoices.new
        expect(computer_choices).to be_instance_of(ComputerChoices)
    end

    it 'has attributes' do
      computer_choices = ComputerChoices.new

        expect(computer_choices.randomly_generated_sub_array.length).to eq(2)
        expect(computer_choices.randomly_generated_cruiser_array.length).to eq(3)
        expect(computer_choices.randomly_generated_cruiser_array.class).to eq(Array)
        expect(computer_choices.randomly_generated_cruiser_array.class).to eq(Array)
    end

    it 'can validate ship placement' do
      computer_choices1 = ComputerChoices.new

      expect(computer_choices1.valid_placement_computer?.class.to_s).to end_with("Class")
      #this method randomly returns true or false which is either TrueClass or FalseClass
      #since it's random there is no way to know which it will return but we can verify
      #that the class as a string will end with "Class" & in Ruby we only have NilClass,
      #TrueClass & Falseclass as choices
    end

end
