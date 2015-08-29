require("spec_helper")

describe(Show) do
  it { should belong_to(:band) }
  it { should belong_to(:venue) }


##### why doesn't this pass spec???
  it { should validate_presence_of(:band_id) }
  it { should validate_presence_of(:venue_id) }
  it { should validate_presence_of(:date) }

  describe('#date') do
    it 'will return the date of a show' do
      new_band = Band.create({:name => 'mouse rat', :category => 'rock'})
      new_venue = Venue.create({:name => 'the rusty can', :location=> 'Austin, TX'})
      date = Date.new(2015, 12, 29)
      new_show = Show.create({:band_id => new_band.id, :venue_id => new_venue.id, :date => date})
      expect(new_show.date).to eq(date)
    end
  end

  describe('#band') do
    it 'will return the band that played at the show' do
      new_band = Band.create({:name => 'mouse rat', :category => 'rock'})
      new_venue = Venue.create({:name => 'the rusty can', :location=> 'Austin, TX'})
      date = Date.new(2015, 12, 29)
      new_show = Show.create({:band_id => new_band.id, :venue_id => new_venue.id, :date => date})
      expect(new_show.band).to eq(new_band)

    end
  end
end
