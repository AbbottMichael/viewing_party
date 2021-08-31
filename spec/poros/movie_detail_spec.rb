require 'rails_helper'

RSpec.describe MovieDetail do
  before :each do
    @movie_detail = MovieDetail.new(
      title: 'Title',
      runtime: 100,
      genres: [{name: 'genre'}],
      overview: 'Overview overview',
      vote_average: 0
    )
  end

  describe 'instantiation' do
    it 'exists' do
      expect(@movie_detail).to be_an_instance_of(MovieDetail)
    end

    it 'has readle attributes' do
      expect(@movie_detail.title).to eq('Title')
      expect(@movie_detail.runtime).to eq(100)
      expect(@movie_detail.genres).to eq(['genre'])
      expect(@movie_detail.overview).to eq('Overview overview')
      expect(@movie_detail.vote_average).to eq(0)
    end
  end

  describe 'instance methods' do
    describe '#format_time' do
      it 'can format the time' do
        expect(@movie_detail.format_time).to eq('1hr 40min')
      end
    end
  end

  describe 'helper methods' do
    describe '#get_genre_names' do
      xit 'returns the genre names' do
        data = {genre:[{id: 1, name: 'genre name'}]}

        expect(get_genre_names(data)).to(['genre name'])
      end
    end
  end
end
