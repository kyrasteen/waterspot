class UsersController < ApplicationController

  def new
  end

  def show
    if is_current_user?(params[:id])
      render :show
    else
      redirect_to root_path
      flash[:error] = "Not authorized"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserNotifier.send_signup_email(@user).deliver
      redirect_to user_path(@user)
      flash[:notice] = "Welcome to waterspot."
    else
      flash[:error] = "There is already an account with that email"
      render :new
    end
  end

  private

  def user_params
   params.require(:user).permit(:email, :username, :remote_avatar_url, :avatar, :password, :password_confirmation)
  end

end
