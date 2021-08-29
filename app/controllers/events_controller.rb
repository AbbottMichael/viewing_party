class EventsController < ApplicationController
  helper_method :movie_details_fetch


  def new
    @event = Event.new
  end

  def create
    event_params[:host_id] = current_user.id
    if event_params[:viewing_time] >= params[:movie_runtime]
      new_event = Event.create(event_params)
      current_user.events << new_event
      redirect_to dashboard_path(params: {title: params[:title]})
    else
      flash[:error] = "Viewing Time must be greater than or equal to runtime."
      redirect_to viewing_party_new_path
    end
  end

  private

  def event_params
    params.permit(:movie_id, :title, :viewing_time, :host_id)
  end
end
