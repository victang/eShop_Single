class IndexController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:index]
  def index
    # Fetch all suitable banners
    @banner = Promotion.where("(? BETWEEN date_from AND date_to) AND (active = ?)", Date.today, true)
    # @banner = Promotion.where("active = 1")
    # @banner = Promotion.all
    @shopitems = Shopitem.where("(active = ?)", true)
    #@shopitems = Shopitem.all
    
    @all_tags = getalltags
    
    if params[:page] != nil
      if (params[:page].to_i > getshopitemmaxpagenum) || (params[:page].to_i < 1)
        not_found
      end 
    end
  end
end
