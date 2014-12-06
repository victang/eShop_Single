class SessionController < ApplicationController
  
  # before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  skip_before_filter :authenticate_user, :only => [:login, :login_attempt]
  
  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path # later change to home
  end
  
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      @current_user = User.find session[:user_id]
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to root_path # later return to shop
    else
      flash[:notice] = "Invalid Username or Password"
      # flash[:color] = "invalid"
      render "login"
    end
  end
  
  def home
  end

  def profile
  end

  def setting
  end
end
