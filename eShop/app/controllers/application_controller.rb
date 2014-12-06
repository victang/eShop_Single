class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :getitemperpage, :getcurrentusername, :getcurrentuseremail, \
                :checkrootexist

  before_filter :authenticate_user
  before_filter :checkrootexistwithaction

  def getalltags
    @promotion_tags = PromotionTag.select(:tag).distinct
    @shopitem_tags = ShopitemTag.select(:tag).distinct
    @all_tags = @promotion_tags + @shopitem_tags
    @all_tags = @all_tags.uniq
    return @all_tags
  end
  
  def getitemperpage
  	# Fetch setting in next version
  	return 36
  end
  
  def getcurrentusername
    if session[:user_id]
      @current_user = User.find session[:user_id]
      return @current_user.username
    else
      return ""
    end
  end
  
  def getcurrentuseremail
    if session[:user_id]
      @current_user = User.find session[:user_id]
      return @current_user.email
    else
      return ""
    end
  end
  
  def checkrootexist
    if (User.exists?(username: "root"))
      return true
    else
      return false
    end
  end
  
  protected
  def authenticate_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
      return true
    else
      @current_user = nil
      session[:user_id] = nil
      redirect_to(:controller => 'session', :action => 'login')
      return false
    end
  end
  
  def save_login_state
    if session[:user_id] && @current_user 
      redirect_to root_path
      return false
    else
      session[:user_id] = nil
      @current_user = nil
      return true
    end
  end
  
  def checkrootexistwithaction
    if (User.exists?(username: "root"))
      return true
    else
      redirect_to(:controller => 'user', :action => 'new')
      return false
    end
  end
  
  def checkrootsession
    if session[:user_id]
      @current_user = User.find session[:user_id]
      if @current_user == "root"
        return true
      else
        return false
      end 
    else
      @current_user = nil
      session[:user_id] = nil
      redirect_to(:controller => 'session', :action => 'login')
      return false
    end
  end
  
end
