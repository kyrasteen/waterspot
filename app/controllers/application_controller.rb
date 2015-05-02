class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user, :is_current_user?

  def current_user
    user = User.find_by(id: session[:user_id])
    @current_user ||= CurrentUser.new(user)
  end

  def is_current_user?(id)
    current_user.id == (id.to_i)
  end
end
