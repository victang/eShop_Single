class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :getitemperpage, :getcurrentusername, :getcurrentuseremail, \
                :checkrootexist, :getshopitemmaxpagenum, :not_found, \
                :grecaptcha_result

  before_filter :authenticate_user
  before_filter :checkrootexistwithaction

  def grecaptcha_result(recaptcha_param)
    @g_recaptcha_response_URL= "https://www.google.com/recaptcha/api/siteverify"
        
    @g_query = {
      "secret" => Recaptcha.configuration.private_key,
      "response" => recaptcha_param,
      "remoteip" => request.remote_ip
    }
        
    if recaptcha_param
      if recaptcha_param != ""
        @g_request = URI.parse(@g_recaptcha_response_URL + '?' + @g_query.to_query)
        @http = Net::HTTP
        @http_instance = @http.new(@g_request.host, @g_request.port)
        if @g_request.port == 443
          @http_instance.use_ssl = 
          @http_instance.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        @g_request_q = Net::HTTP::Get.new(@g_request.request_uri)
        @g_result = @http_instance.request(@g_request_q)
        @g_return_0, @g_return_1 = JSON.parse(@g_result.body).values
        return [@g_return_0, @g_return_1]
      else
        return nil
      end
    else
      return nil
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def getalltags
    @all_tags = Array.new
    PromotionTag.select(:tag).distinct.each do |i|
      @all_tags.insert(-1, i.tag)
    end
    ShopitemTag.select(:tag).distinct.each do |j|
      @all_tags.insert(-1, j.tag)
    end
    return @all_tags.uniq.sort
  end
  
  def getitemperpage
  	# Fetch setting in next version
  	return 36
  end
  
  def getshopitemmaxpagenum
    @shopitem_count = Shopitem.where("(active = ?)", true).count
    if (@shopitem_count % getitemperpage > 0)
      return (@shopitem_count / getitemperpage) + 1
    else
      return @shopitem_count / getitemperpage
    end
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
      redirect_to(:controller => 'users', :action => 'new')
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
  
  def load_cart
    if authenticate_user == true
      @cart = Cart.where("(user_id = ?) AND (batch_id = 0)", session[:user_id])
    else
    @cart = nil
    end
  end  
end
