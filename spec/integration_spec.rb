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
