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

    it 'cannot overlap ships by accident' do
      computer_choices = ComputerChoices.new

      expect(computer_choices.valid_placement_computer?).to eq(true)
    end

    xit 'cannot place ships outside of the board' do
      computer_choices = ComputerChoices.new

    end
end
