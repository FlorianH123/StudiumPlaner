class EventsController < ApplicationController
  before_action

  def index
    @events = Event.all.where('date_to > ?', DateTime.current)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = t('events.event_saved')
    else
      flash[:alert] = @event.errors.full_messages.map(&:inspect).join(', ')
    end

    @event.users.each do |participant|
      EventMailer.notify_event_participants(@event, current_user, participant).deliver
    end

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:date_from, :date_to, :place, :title, user_ids: [])
  end
end
