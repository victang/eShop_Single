class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :getitemperpage

  def getitemperpage
  	# Fetch setting in next version
  	return 36
  end
end
