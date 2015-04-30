class UserAreaWatch < ApplicationMailer
  default :from => 'waterspotapp@gmail.com'

  def self.send_update_email(user, spot)
    binding.pry
    @user = user
    @spot = spot
    mail( :to => @user.email,
         :subject => 'New spot in your area!' )
  end
end
