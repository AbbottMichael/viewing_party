class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorized?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorized?
    if current_user.nil?
      flash[:error] = 'Please Log-In.'
      redirect_to root_path
    end
  end
end
