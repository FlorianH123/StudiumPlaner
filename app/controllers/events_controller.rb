class EventsController < ApplicationController
  def show
    @events = Event.new
    @events = Event.where('user_id = ?', current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user


    @event.save

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:date_from, :date_to, :place, :title)
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end
end
