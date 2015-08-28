require('spec_helper')

describe('adding a band', {:type => :feature}) do
  it 'allows a user to add a band to the band tracker database' do
    visit('/bands')
    fill_in('name', :with => 'mouse rat')
    fill_in('category', :with => 'rock')
    click_button('Add Band')
    expect(page).to have_content('Mouse Rat')
  end
end

describe('adding a venue', {:type => :feature}) do
  it 'allows a user to add a venue to the band tracker database' do
    visit('/venues')
    fill_in('name', :with => 'stubbs')
    fill_in('city', :with => 'austin')
    select('TX', :from => 'state')
    click_button('Add Venue')
    expect(page).to have_content('Stubbs')
  end
end
