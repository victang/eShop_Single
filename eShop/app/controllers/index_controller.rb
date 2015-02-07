class IndexController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:index]
  skip_before_filter :verify_authenticity_token  
  skip_before_action :verify_authenticity_token
    
  def index
    params.permit!
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
    
    if !params[:index].nil?
      if !params[:index][:tag].nil?
        @selected_tags = params[:index][:tag]
      end
    end
    
    @temp_keyword = ""
    @temp_keyword_s = ""
    # Check the keywords
    if !params[:index].nil?
      if !params[:index][:keyword].nil?
        if params[:index][:keyword] != ""
          @temp_keyword = "%" + params[:index][:keyword].to_s + "%"
          @temp_keyword_s = params[:index][:keyword].to_s
          @shopitems = @shopitems.where("(short_name LIKE ?) OR (long_name LIKE ?) OR (descr LIKE ?)", @temp_keyword, @temp_keyword, @temp_keyword)
        end
      end
    end
    
    # Check the tags
    if !@selected_tags.nil?
      if !@selected_tags.empty?
        # This is the part we do the filtering by tags
      end
    end
  
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def add_to_cart
    @user_id = 0
    @item_id = 0
    @unit = 0
    if authenticate_user == true
      params.permit!
      @user_id = session[:user_id]
      if !params[:item_id].nil?        
        # id exist in record without batch, draw it out
        @search_cart_item = Cart.where("(batch_id = 0) AND (user_id = ?) AND (shopitem_id = ?)", session[:user_id], params[:item_id].to_i)
        if !@search_cart_item.empty?
          @old_cart_item = @search_cart_item.first
          @tmp_unit_count = @old_cart_item.shopitem_amount.to_i
          @old_cart_item.shopitem_amount = 0
          @old_cart_item.shopitem_amount = @tmp_unit_count + params[:unit].to_i
          @old_cart_item.pay_amount = Shopitem.find_by_id(params[:item_id].to_i).price * @old_cart_item.shopitem_amount 
          @old_cart_item.selected = true
          
          @old_cart_item.save
          params.delete(:unit)
          params.delete(:item_id)
        else
          # if not found on existing record, add new
          @new_cart_item = Cart.new
          @new_cart_item.user_id = session[:user_id]
          @new_cart_item.batch_id = 0
          @new_cart_item.shopitem_id = params[:item_id].to_i
          @new_cart_item.shopitem_amount = params[:unit].to_i
          @new_cart_item.pay_amount = Shopitem.find_by_id(params[:item_id].to_i).price * params[:unit].to_i
          @new_cart_item.selected = true
        
          @new_cart_item.save
          params.delete(:unit)
          params.delete(:item_id)
        end
      end
    end
  end
end
