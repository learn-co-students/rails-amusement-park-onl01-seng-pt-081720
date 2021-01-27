class UsersController < ApplicationController
  before_action :require_login, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)    
    else                  #Try to catch an error
      flash[:message] = "Invalid"
      render :new
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
    if redirect_from_ride
      ride = @user.rides.build(attraction_id: params[:attraction_id])      
      @message = ride.take_ride
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
  
  def redirect_from_ride
    !!params[:attraction_id]
  end

end