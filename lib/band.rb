class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates(:category, {:presence => true, :length => { :maximum => 50 }})
  before_save(:capitalize_words)

  # define_method(:not_played) do
  #   @venues = Band.venues
  #   not_played = []
  #   @venues.each() do |venue|
  #     unless self.bands.include?(venue)
  #     not_played.push(venue)
  #   end
  #   not_played
  # end

private
  define_method(:capitalize_words) do
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
