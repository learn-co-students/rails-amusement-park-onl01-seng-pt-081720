class AttractionsController < ApplicationController
  before_action :require_login
  before_action :verify_admin, only: [:new, :edit]
  
  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.new
    @user = current_user
  end

  def update
    attraction = Attraction.find_by_id(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def delete
    attraction = Attraction.find_by_id(params[:id])
    attraction.destroy
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def verify_admin
    !!User.find_by_id(session[:user_id]).admin
  end
end