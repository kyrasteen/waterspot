# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview
  def send_signup_email_preview
    UserNotifier.send_signup_email(User.last)
  end
end
