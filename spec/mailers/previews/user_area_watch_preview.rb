# Preview all emails at http://localhost:3000/rails/mailers/user_area_watch
class UserAreaWatchPreview < ActionMailer::Preview
  def send_update_email_preview
    UserAreaWatchPreview.send_update_email(User.last)
  end
end

