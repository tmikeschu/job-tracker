class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if current_user
      flash[:error] = "Don't worry, you are already logged in!"
      redirect_to dashboard_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success]   = "Login successful!"
      redirect_to dashboard_path
    else
      if @user
        @errors = @user.errors.full_messages
        flash.now[:error] = "Incorrect password. Try again."
      else
        flash.now[:error] = "Unknown email. Try again."
      end
      render :new
    end
  end
end