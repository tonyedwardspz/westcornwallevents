class EventAdminNotifier < ApplicationMailer
  default :from => 'admin@westcornwallevents.co.uk'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_submission_admin_email(event)
    @user = user
    mail( :to => 'tony.edwards@gmail.com',
    :subject => 'A new event has been submitted' )
  end
end
