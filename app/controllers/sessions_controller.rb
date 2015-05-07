class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:provider]
      oauth_login
    else
      user_login
    end
  end

  def destroy
    session.clear
    flash[:notice] = "you have been signed out"
    redirect_to root_path
  end

  private

  def oauth_login
    user = User.update_user_from_auth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      flash[:notice] = "signed in as #{user.username}"
      redirect_to root_path
    else
      flash[:error] = "Please register with waterspot"
      redirect_to root_path
    end
  end

  def user_login
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error]="invalid information"
      render :new
    end
  end
end
