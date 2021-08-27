require 'rails_helper'

RSpec.describe 'The Movie Index page' do
  describe 'The Top Fourty Movies' do
    it 'displays the top 40 rated movies', :vcr do
      visit movies_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content(8.8)
      # expect(@popular_movies_1[keys]['title'].count).to eq(20)
      # expect(@popular_movies_2.count).to eq(20)
    end

    it "links to an individual movie's show page", :vcr do
      visit movies_path
      
      click_on "Dilwale Dulhania Le Jayenge"

      expect(current_path).to eq(movie_path(19404))
    end
  end
end
