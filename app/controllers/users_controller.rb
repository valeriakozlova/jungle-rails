class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      # understand how this session thing works
      session[:user_id] = user.id
      redirect_to '/'
      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_now

    else
      render '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end



