class DashboardController < ApplicationController
  before_action :require_login

  def show
    # byebug
  end

  private
    def require_login
      redirect_to login_path unless current_user
    end
end
