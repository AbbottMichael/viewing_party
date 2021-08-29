require 'rails_helper'

RSpec.describe 'The Discover index page' do
  before :each do
    visit discover_path
  end

  it "has a button to display 'Find Top Rated Movies'", :vcr do
    click_on 'Find Top Rated Movies'

    expect(current_path).to eq(movies_path)
  end

  it "displays a search form", :vcr do
    fill_in 'search', with: 'batman'
    click_on 'Find Movies'

    expect(current_path).to eq(movies_path)
    expect(page).to have_content('Batman')
    expect(page).to have_content('Batman Begins')
    expect(page).to have_content('The Lego Batman Movie')
  end

  it "displays an error message if search field is submitted blank", :vcr do
    click_on 'Find Movies'

    expect(current_path).to eq(discover_path)
    expect(page).to have_content('Please enter a search parameter')
  end
end
