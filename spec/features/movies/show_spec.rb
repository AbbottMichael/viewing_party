require 'rails_helper'

RSpec.describe 'The Movie Show Page' do
  it "displays the movie's 'runtime, overview, genres and vote average'", :vcr do
    visit movie_path(19404)

    within '#Runtime' do
      expect(page).to have_content("3hr 10min")
    end
    within '#Overview' do
      overview = "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga."
      expect(page).to have_content(overview)
    end
    within '#Genres' do
      genres = "Comedy Drama Romance"
      expect(page).to have_content(genres)
    end
    within '#Vote_Average' do
      expect(page).to have_content(8.8)
    end
  end

  it 'has a link to create a new viewing party', :vcr do
    visit movie_path(19404)

    expect(page).to have_button("Create A Viewing Party")
  end

  it "should have the images", :vcr do
    visit movie_path(19404)
    
    expect(page).to have_css("img[src*='https://www.themoviedb.org/t/p/w300_and_h450_bestv2/2CAL2433ZeIihfX1Hb2139CX0pW.jpg']")
  end
end
