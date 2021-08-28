require 'rails_helper'

RSpec.describe 'The Movie Index page' do
  describe 'The Top Fourty Movies' do
    it 'displays the top 40 rated movies', :vcr do
      visit movies_path

      expect(page.status_code).to eq(200)
      within '#Top-Movies' do
        expect(page).to have_content("Dilwale Dulhania Le Jayenge")
        expect(page).to have_content(8.8)
        expect(page).to have_css("p", count: 40)
      end
    end

    it "links to an individual movie's show page", :vcr do
      visit movies_path

      click_on "Dilwale Dulhania Le Jayenge"

      expect(current_path).to eq(movie_path(19404))
    end

    it "displays a search form", :vcr do
      visit movies_path

      fill_in 'search', with: 'batman'
      click_on 'Find Movies'

      expect(current_path).to eq(movies_path)

      within '#Search' do
        expect(page).to have_content('Batman')
        expect(page).to have_content('Batman Begins')
        expect(page).to have_content('The Lego Batman Movie')
        expect(page).to_not have_content("Dilwale Dulhania Le Jayenge")
        expect(page).to have_css("p", maximum: 40)
      end
    end
  end
end
