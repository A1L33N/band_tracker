class Venue <ActiveRecord::Base
  has_and_belongs_to_many(:bands)

  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates(:location, {:presence => true, :length => { :maximum => 50 }})
  before_save(:capitlize_words)

private
  define_method(:capitlize_words) do
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
