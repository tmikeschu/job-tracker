class ApplicationController < ActionController::Base
  before_action :require_login

  protect_from_forgery with: :exception

  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
    def require_login
      redirect_to login_path unless current_user
    end
end
