class Venue <ActiveRecord::Base
  has_many(:shows)
  has_many(:bands, through: :shows)

  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates(:location, {:presence => true, :length => { :maximum => 50 }})
  before_save(:capitalize_words)


private
  define_method(:capitalize_words) do
    self.name = name.downcase.split.map(&:capitalize).join(' ')
  end
end
