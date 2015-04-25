require File.expand_path('../application', __FILE__)

Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name            => ENV["SENDG_USERNAME"],
  :password             => ENV["SENDG_PASSWORD"],
  :domain               => 'https://waterspot.herokuapp.com',
  :address              => 'smtp.sendgrid.net',
  :port                 => 587,
  :authentication       => :plain,
  :enable_starttls_auto => true
}
