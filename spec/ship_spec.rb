require './lib/ship'

RSpec.describe do
    before :each do
        @cruiser = Ship.new("Cruiser", 3)
    end 

    it 'exists' do
        expect(@cruiser).to be_instance_of(Ship)
    end 

end