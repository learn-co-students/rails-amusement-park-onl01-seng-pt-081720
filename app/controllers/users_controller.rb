class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :require_login, only: [:show]
  
  def index
    
  end

  
  def show
    if !logged_in?
      redirect_to "/"
    else
      render :show
    end
  end

  def new
    # @attraction = Attraction.new
    @user = User.new
  end

  def authorize
    @user = User.find(user_params_2.to_i)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def edit

  end

  def signin
    @users = User.all
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  
  def update
    
  end

  
  def destroy
    
  end

  

  private

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      current_user != nil
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def user_params_2
      params.require(:user_name)
    end

    
end
