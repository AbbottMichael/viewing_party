class MoviesController < ApplicationController
  before_action :popular_movies_1_fetch
  before_action :popular_movies_2_fetch

  def index
  end

  def show
    # movie = Movie.find(params[:id])
  end

  def popular_movies_1_fetch
    json = MovieService.new.popular_movies_1
    @popular_movies_1 = json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def popular_movies_2_fetch
    json = MovieService.new.popular_movies_2
    @popular_movies_2 = json[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
