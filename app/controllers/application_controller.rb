class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def current_user  
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    return
  end  

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to '/login' unless logged_in?
  end
end
