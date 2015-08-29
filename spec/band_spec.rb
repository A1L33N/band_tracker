require("spec_helper")

describe(Band) do
  describe('#venues') do
    it { should have_many(:venues) }
  end


  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }

  it 'capitalizes all the words in a band name' do
    new_band = Band.create({:name => 'mouse rat', :category => 'rock'})
    expect(new_band.name).to eq('Mouse Rat')
  end
end
