require("spec_helper")

describe(Band) do
  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end

  # describe('#not_played') do
  #   it 'will return the venues a band has not played at' do
  #     venue1 = Venue.create({:name => 'The Old Mill', :location =>'Escondido, Ca'})
  #     venue2 = Venue.create({:name => 'The Old Factory', :location =>'Escondido, Ca'})
  #     band1 = Band.create({:name => 'Mouse Rat', :category => 'rock'})
  #     band1.venues.push(venue1)
  #     expect(band1.not_played).to eq([band2])
  #   end
  # end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }

  it 'capitalizes all the words in a band name' do
    new_band = Band.create({:name => 'mouse rat', :category => 'rock'})
    expect(new_band.name).to eq('Mouse Rat')
  end
end
