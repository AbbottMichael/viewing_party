class ApplicationController < ActionController::Base
  # before_action :popular_movies_1_fetch
  # before_action :popular_movies_2_fetch
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  # def popular_movies_1_fetch
  #   json = MovieService.new.popular_movies_1
  #   @popular_movies_1 = json[:results].map do |movie|
  #     Movie.new(movie)
  #   end
  # end
  #
  # def popular_movies_2_fetch
  #   json = MovieService.new.popular_movies_2
  #   @popular_movies_2 = json[:results].map do |movie|
  #     Movie.new(movie)
  #   end
  # end
end
