class UserAreaWatch < ApplicationMailer
  default :from => 'waterspotapp@gmail.com'

  def send_update_email(user)
    @user = user
    mail( :to => @user.email,
         :subject => 'New spot in your area!' )
  end
end
