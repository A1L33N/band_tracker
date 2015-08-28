require("spec_helper")

describe(Band) do
  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }
end
