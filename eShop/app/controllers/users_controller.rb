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
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end
end
