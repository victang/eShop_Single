class IndexController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:index]
  skip_before_filter :verify_authenticity_token  
  skip_before_action :verify_authenticity_token
    
  def getshopitemswithfilter(in_keyword, in_tags)
    # expect input:
    #   in_keyword: string
    #   in_tags: array[string]
    # expect output:
    #  out_pagenumber: integer
    #  out_items: array[model:shopitem]
    if (in_keyword.strip == "") && ((in_tags.empty? == true) || (in_tags == nil))
      out_items = Shopitem.where("(active = ?)", true)
    else  
      if ((in_tags.empty? == true) || (in_tags == nil))
        tmp_realkeyword = "%" + in_keyword.strip.gsub(" ", "%") + "%"
        out_items = Shopitem.where("((UPPER(short_name) LIKE UPPER(?)) OR (UPPER(long_name) LIKE UPPER(?))) AND (active = ?)", tmp_realkeyword, tmp_realkeyword, true)
      else 
        tmp_itemswithtag = ShopitemTag.where(tag: in_tags).select("shopitem_id")
        tmp_realkeyword = "%" + in_keyword.strip.gsub(" ", "%") + "%"
        out_items = Shopitem.where("((UPPER(short_name) LIKE UPPER(?)) OR (UPPER(long_name) LIKE UPPER(?))) AND (id IN (?)) AND (active = ?)", tmp_realkeyword, tmp_realkeyword, tmp_itemswithtag, true)
      end
    end 
    if (out_items.count % getitemperpage > 0)
      out_pagenumber = (out_items.count / getitemperpage) + 1
    else
      out_pagenumber = out_items.count / getitemperpage
    end
    
    return out_pagenumber, out_items
  end
    
  def index
    params.permit!
    # Fetch all suitable banners
    @banner = Promotion.where("(? BETWEEN date_from AND date_to) AND (active = ?)", Date.today, true)
    @all_tags = getalltags
    
    @selected_tags = []
    if !params[:tags].nil?
      params[:tags].each do |v|
        @selected_tags.push(v.to_s)
      end
    else
      if !params[:index].nil?
        if !params[:index][:tag].nil?
          params[:index][:tag].each do |e, v|
            @selected_tags.push(v.to_s)
          end
        end
      end
    end
    
    @selected_keyword = ""
    if !params[:keyword].nil?
      @selected_keyword = params[:keyword]
    else
      if !params[:index].nil?
        if !params[:index][:keyword].nil?
          @selected_keyword = params[:index][:keyword]
        end
      end
    end
    
    @maxpagenum, @shopitems = getshopitemswithfilter(@selected_keyword, @selected_tags)
    
    if params[:page] != nil
      if (params[:page].to_i > @maxpagenum) || (params[:page].to_i < 1)
        not_found
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
