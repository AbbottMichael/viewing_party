class MoviesController < ApplicationController

  def index
    top_rated_movies_fetch
    movie_search_fetch if params[:search]
  end

  def show
    movie_details_fetch
    movie_cast_fetch
    movie_reviews_fetch
  end

  def movie_search_fetch
    if params[:search] == ""
      flash[:error] = 'Please enter a search parameter'
      redirect_to discover_path
    else
      json = MovieService.new.get_movie_search(params[:search])
      @results = json[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end

  def top_rated_movies_fetch
    json = MovieService.new.get_top_rated_movies
    @top_rated_movies = json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_details_fetch
    json = MovieService.new.get_movie_details(params[:id])
    @movie_details = MovieDetail.new(json)
    @runtime = @movie_details.runtime
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
