class MoviesController < ApplicationController

  def index
    @top_rated_movies = MovieFacade.top_rated_movies_fetch
    @results = movie_search if params[:search]
  end

  def show
    @movie_details = MovieDetailFacade.movie_details_fetch(params[:id])
    @movie_cast = MovieCastFacade.movie_cast_fetch(params[:id])
    @movie_reviews = MovieReviewFacade.movie_reviews_fetch(params[:id])
  end

  def movie_search
    if params[:search] == ""
      flash[:error] = 'Please enter a search parameter'
      redirect_to discover_path
    else
      MovieFacade.movie_search_fetch(params[:search])
    end
  end
end
