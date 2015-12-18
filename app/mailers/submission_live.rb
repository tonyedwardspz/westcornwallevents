class SubmissionLive < ApplicationMailer
  default from: 'thanks@westcornwallevents.co.uk'
  # layout 'send_submission_admin_email'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def submission_live_email(user_event, event)
    @this_event = event
    mail( to: "{user_event.user_email}",
    subject: "Your event is now live." )
  end
end
