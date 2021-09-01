class EventsController < ApplicationController
  helper_method :movie_details_fetch

  def new
  end

  def create
    if params[:friend].all? { |friend| friend == '' }
      flash[:error] = 'Please include at least 1 friend.'
      redirect_to viewing_party_new_path
    elsif event_params[:viewing_time].to_i >= session[:movie]['runtime']
      new_event = Event.create(event_params)
      current_user.events << new_event
      params[:friend].each do |friend|
        Attendee.create(event_id: new_event.id, user_id: friend.to_i) unless friend == ''
      end
      redirect_to dashboard_path
      session[:movie] = nil
    else
      flash[:error] = 'Viewing Time must be greater than or equal to runtime.'
      redirect_to viewing_party_new_path
    end
  end

  private

  def event_params
    params.permit(:title, :viewing_time, :date_time)
          .merge(movie_id: session[:movie]['movie_id'].to_i, host_id: current_user.id)
  end
end
