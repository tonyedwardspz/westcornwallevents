ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.secrets.sendgrid_username,
  :password => Rails.application.secrets.sendgrid_password,
  :domain => 'westcornwallevents.co.uk',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
