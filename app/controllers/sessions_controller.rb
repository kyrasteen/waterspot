class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:provider]
      user = User.find_or_create_by_auth(request.env['omniauth.auth'])
      if user
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      user = User.find_by(email: params[:session][:email])
      if user
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render :new
      end
    end
  end

  def destroy
    session.clear
    flash[:notice] = "you have been signed out"
    redirect_to root_path
  end
end
