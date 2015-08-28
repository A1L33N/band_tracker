require("spec_helper")

describe(Venue) do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }

  describe '#bands' do
    it { should have_and_belong_to_many(:bands) }
  end

end
