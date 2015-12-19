class EventAdminNotifier < ApplicationMailer
  default from: 'admin@westcornwallevents.co.uk'
  # layout 'send_submission_admin_email'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_submission_admin_email(event)
    @event = event
    mail( to: 'tony.edwards@gmail.com',
    subject: "A new event has been submitted: #{event.title}" )
  end
end
