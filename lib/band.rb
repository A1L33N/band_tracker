class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates(:type, {:presence => true, :length => { :maximum => 50 }})
end
