class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_login
    if !session[:user_id]
      redirect_to '/'
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
