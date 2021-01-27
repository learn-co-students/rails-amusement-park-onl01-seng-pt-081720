class SessionsController < ApplicationController
  
  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user_name])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else                         #Try to catch an error
      flash[:message] = "Invalid Username or Password"
      redirect_to :new
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end
end
