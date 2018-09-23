class EventMailer < ApplicationMailer
  def notify_event_participants(event, emailer, user_to)
    @event = event
    @user_from = emailer
    @user_to = user_to

    mail ({
        subject: @event.title,
        to: @user_to.email,
        from: @user_from.email
    })
  end
end
