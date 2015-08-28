class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates(:category, {:presence => true, :length => { :maximum => 50 }})
  before_save(:capitalize_words)


private
  define_method(:capitalize_words) do
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
