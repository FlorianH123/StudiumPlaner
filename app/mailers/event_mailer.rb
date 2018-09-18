class EventMailer < ApplicationMailer
  def notify_event_participants(event, emailer)
    @event = event
    @user = emailer

    mail ({
        subject: @event.title,
        to: "f.hennrich@gmx.de",
        from: emailer.email
    })
  end
end
