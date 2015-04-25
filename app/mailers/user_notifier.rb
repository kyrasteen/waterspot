class UserNotifier < ApplicationMailer
  default :from => 'waterspot@gmail.com'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
         :subject => 'Thanks for signing up for our waterspot' )
  end
end
