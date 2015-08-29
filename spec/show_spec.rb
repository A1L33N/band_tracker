require("spec_helper")

describe(Show) do
  it { should belong_to(:band) }
  it { should belong_to(:venue) }
end
