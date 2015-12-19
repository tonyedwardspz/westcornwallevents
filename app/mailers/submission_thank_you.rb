class SubmissionThankYou < ApplicationMailer
  default from: 'thanks@westcornwallevents.co.uk'

  def submission_thankyou_email(event)
    @event = event
    mail( to: "#{event.user_email}",
    subject: "Thank you for submitting '#{event.title}'" )
  end
end
