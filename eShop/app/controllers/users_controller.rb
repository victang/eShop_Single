class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  skip_before_filter :authenticate_user, :only => [:new, :create]
  skip_before_filter :checkrootexistwithaction, :only => [:new, :create]
  def new
    @user = User.new
  end
  def create
    params.permit!
    @user = User.new(params[:user])
    # @user.acclock = true
    # @user.active = false
    @g_recaptcha_response = grecaptcha_result(params['g-recaptcha-response'])
    if !@g_recaptcha_response.nil?
      if @g_recaptcha_response[0] == true
        if @user.save
          flash[:notice] = "newuser;success"
          # Generate E-mail - do it later
          # render "create"
          redirect_to controller: "session", action: "login"
        else
          # Check reason here
          if !User.where(:username => params[:user][:username]).empty? || !User.where(:email => params[:user][:email]).empty? 
            flash[:notice] = "newuser;fail;userexist"
          else
            if params[:user][:password] != params[:user][:password_confirmation]
              flash[:notice] = "newuser;fail;passwordnotmatch"
            else
              flash[:notice] = "newuser;fail;internal"
            end
          end
          redirect_to controller: "users", action: "new"
        end
      else
        flash[:notice] = "newuser;recaptchafail;" + @g_recaptcha_response[1].to_s
        redirect_to controller: "users", action: "new"
      end
    else
      flash[:notice] = "newuser;recaptchafail;notcompleted"
      redirect_to controller: "users", action: "new"
    end
  end
end
