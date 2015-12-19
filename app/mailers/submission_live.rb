class SubmissionLive < ApplicationMailer
  default from: 'thankyou@westcornwallevents.co.uk'

  def submission_live_email(event)
    logger.debug "LOGGER: Subbmission Live Email method - #{event.event_user.email}"
    @this_event = event
    mail( to: "#{event.event_user.email}",
    subject: "Your event is now live." )
  end
end
