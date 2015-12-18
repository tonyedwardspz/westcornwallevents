class SubmissionThankYou < ApplicationMailer
  default from: 'thanks@westcornwallevents.co.uk'
  # layout 'send_submission_admin_email'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def submission_thankyou_email(event)
    @event = event
    mail( to: "{event.user_email}",
    subject: "Thank you for submitting '#{event.title}'" )
  end
end
