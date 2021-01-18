class RidesController < ApplicationController
  before_action :set_ride, only: [:edit, :update, :destroy]

  
  def index
    
  end

  
  def show
   
  end

  
  def new
    @ride = Ride.new(ride_params)
    flash[:message] = @ride.take_ride
      
    redirect_to user_path(@ride.user)
  end

  
  def edit

  end

  
  def create
    
  end

  
  def update
    
  end

  
  def destroy
   
  end

  private
    
    def set_ride
      @ride = Ride.find(params[:id])
    end

    
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
    
end
