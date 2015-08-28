require("spec_helper")

describe(Venue) do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }

  it 'capitalizes all the words in a venue name' do
    new_venue = Venue.create({:name => 'the rusty can', :location=> 'Austin, TX'})
    expect(new_venue.name).to eq('The Rusty Can')
  end

  describe '#bands' do
    it { should have_and_belong_to_many(:bands) }
  end

end
