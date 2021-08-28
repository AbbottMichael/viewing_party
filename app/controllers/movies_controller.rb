class MoviesController < ApplicationController
  before_action :popular_movies_1_fetch
  before_action :popular_movies_2_fetch

  def index
  end

  def show
    movie_details_fetch
    movie_cast_fetch
    movie_reviews_fetch
    # movie = Movie.find(params[:id])
  end

  def popular_movies_1_fetch
    json = MovieService.new.get_popular_movies_1
    @popular_movies_1 = json[:results].map do |movie|
      TopRatedMovie.new(movie)
    end
  end

  def popular_movies_2_fetch
    json = MovieService.new.get_popular_movies_2
    @popular_movies_2 = json[:results].map do |movie|
      TopRatedMovie.new(movie)
    end
  end

  def movie_details_fetch
    json = MovieService.new.get_movie_details(params[:id])
    @movie_details = MovieDetail.new(json)
    @runtime = @movie_details.runtime
    # require "pry"; binding.pry
  end

  def movie_cast_fetch
    json = MovieService.new.get_movie_cast(params[:id])
    @movie_cast = json[:cast][0..9].map do |cast_member|
      MovieCast.new(cast_member)
    end
  end

  def movie_reviews_fetch
    json = MovieService.new.get_movie_reviews(params[:id])
    @movie_reviews = json[:results].map do |review|
      MovieReview.new(review)
    end
  end
end
