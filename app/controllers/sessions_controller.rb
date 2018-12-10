class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate_with_credentials(params[:email], params[:password])
      user = User.find_by_email(params[:email])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end




