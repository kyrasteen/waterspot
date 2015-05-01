class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user, :is_current_user?

  def current_user
    @current_user ||= CurrentUser.new(User.find_by(id: session[:user_id]))
  end

  def is_current_user?(id)
    id == current_user.id.to_s
  end
end
