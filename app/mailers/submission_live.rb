class SubmissionLive < ApplicationMailer
  default from: 'thanks@westcornwallevents.co.uk'
  # layout 'send_submission_admin_email'

  def submission_live_email(event)
    @this_event = event
    mail( to: "{event.event_user.email}",
    subject: "Your event is now live." )
  end
end
