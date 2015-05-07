class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user, :is_current_user?, :authorize

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def is_current_user?(id)
    current_user && current_user.id == (id.to_i)
  end

  def authorize
    head :unauthorized unless current_user
  end
end
