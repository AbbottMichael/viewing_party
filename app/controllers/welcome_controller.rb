class WelcomeController < ApplicationController
  before_action :logged_in?
  skip_before_action :authorized?

  def index; end

  def logged_in?
    redirect_to dashboard_path if current_user
  end
end
