require 'paypal-sdk-rest'
include PayPal::SDK::REST

class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  def add
    if params['cart']['shopitem_id'] && params['cart']['shopitem_amount']
      # Add the stuff into session cart
      @tmp_shopitem_id = params['cart']['shopitem_id']
      @tmp_shopitem_amount = params['cart']['shopitem_amount']
      if cookies[:cart] != nil
        @cart_array = cookies[:cart]
      else
        @cart_array = Array.new
      end
      
      # check if array has component
      @write_done = false
      @cart_array.each_with_index do |element, content|
        if content[1] == @tmp_shopitem_id
          @cart_array[element] = [@tmp_shopitem_id, cart_array[element][2] + @tmp_shopitem_amount]
          @write_done = true
        end
      end
      if @write_done == false
        @cart_array << [@tmp_shopitem_id, @tmp_shopitem_amount]
      end
      cookies[:cart] = @cart_array
    end
    
  end
  
  def session_cart
    if cookies[:cart] != nil
      @cart_array = cookies[:cart]
    else
      @cart_array = Array.new
    end
  end
  
  def pending
    # Load cart items here
    @pending_cart = Cart.where("(batch_id = 0) AND (user_id = ?)", session[:user_id]) #.select("shopitem_id, sum(shopitem_amount) as shopitem_amount, sum(pay_amount) as pay_amount").group("shopitem_id")
  end

  def edit_pending
    if params['cart']
      if params['cart']['del']
        params['cart']['del'].each do |c, k|
          if c != 0
            if k.to_s == 'true'
              Rails.logger.debug("debug: c = " + c.to_s + "; k = " + k.to_s)
              Cart.delete(c.to_s)
              # @tmp_rec = Cart.delete(c.to_s)
            end 
          end
        end 
      end
      
      if params['cart']['unit']
        params['cart']['unit'].each do |c, k|
          if c != 0
            Rails.logger.debug("debug: unit.c = " + c.to_s + "; unit.k = " + k.to_s + "; unitold.k = " + params['cart']['unitold'][c.to_s].to_s + ";")
            if k.to_i != params['cart']['unitold'][c.to_s].to_i
              Rails.logger.debug("Start Update.")
              @tmp_rec = Cart.find_by_id(c.to_s)
              if !@tmp_rec.blank?
                @tmp_rec.shopitem_amount = k.to_i
                @tmp_rec.save
              end
            end
          end
        end 
      end
    end
    redirect_to controller: "carts", action: "pending"
  end

  def checkout
    @pending_cart = Cart.where("(batch_id = 0) AND (user_id = ?)", session[:user_id])
    @new_batch = Batch.new
    
    @latest_buyerdetail = Batch.where("user_id = ?", session[:user_id]).order("created_at DESC, updated_at DESC").first
    
  end
  
  def save_checkout
    @new_batch = Batch.new
    
    @new_batch.code = "0"
    @new_batch.status = 0
    @new_batch.remark = "[System] New Order Generated."
    @new_batch.active = true
    @new_batch.user_id = session[:user_id]
    @new_batch.email = params[:batch][:email]
    @new_batch.fullname = params[:batch][:fullname]
    @new_batch.address1 = params[:batch][:address1]
    @new_batch.address2 = params[:batch][:address2]
    @new_batch.address3 = params[:batch][:address3]
    @new_batch.address4 = params[:batch][:address4]
    @new_batch.address5 = params[:batch][:address5]
    @new_batch.address6 = params[:batch][:address6]
    @new_batch.country = params[:batch][:country]
    @new_batch.city = params[:batch][:city]
    @new_batch.phone = params[:batch][:phone]
    @new_batch.user_remark = params[:batch][:remark]
    @new_batch.mailagent = params[:batch][:serviceprovider]
    @new_batch.mailfee = params[:batch][:mailfee]
    if @new_batch.save 
      # if saved, bring all the cart items in
      Cart.where("(batch_id = 0) AND (user_id = ?)", session[:user_id]).update_all(:batch_id => @new_batch.id)
      flash[:notice] = "checkout;success;gotopaypal"
      
      @tmp_thiscart = Cart.where("(batch_id = ?) AND (user_id = ?)", @new_batch.id, session[:user_id])
      
      @tmp_itemlist = Array.new
      @tmp_thiscart.each_with_index do |content, element|
        @tmp_shopitem = Shopitem.find(content.shopitem_id)
        @tmp_itemlist.push({
          :name => @tmp_shopitem.short_name,
          :sku => @tmp_shopitem.code_name,
          :price => sprintf("%.2f", @tmp_shopitem.price.to_f),
          :currency => "HKD",
          :quantity => content.shopitem_amount
        })
      end
      
      # finally add the delievery price on it
      @tmp_itemlist.push({
        :name => "Delivery Price",
        :sku => "DELIEVRY_PRICE",
        :price => sprintf("%.2f", params[:batch][:mailfee].to_f),
        :currency => "HKD",
        :quantity => 1
      })
      
      Rails.logger.debug("ItemList = " + @tmp_itemlist.to_s)
          
      @payment = Payment.new({
        :intent => "sale",
        :payer => {
          :payment_method => "credit_card",
          :funding_instruments => [{
            :credit_card => {
              :type => params[:card][:type],
              :number => params[:card][:number],
              :expire_month => params[:card][:expire_month],
              :expire_year => params[:card][:expire_year],
              :cvv2 => params[:card][:cvv2],
              :first_name => params[:card][:first_name],
              :last_name => params[:card][:last_name],
              :billing_address => {
                :line1 => params[:card][:address][:line1],
                :line2 => params[:card][:address][:line2],
                :city => params[:card][:address][:city],
                :state => params[:card][:address][:state],
                :postal_code => params[:card][:address][:postal_code],
                :country_code => params[:card][:address][:country_code].to_s.upcase
              }
            }
          }]
        },
        :transactions => [{
          :item_list => {
            :items => @tmp_itemlist
          },
          :amount => {
            :total => sprintf("%.2f", params[:batch][:finalpayment].to_f),
            :currency => "HKD"
          },
          :description => "Payment Batch ID: " + @new_batch.id.to_s + "; Pay by PayPal."
        }]
      })
      if @payment.create
        flash[:notice] = "paypal;success;" + @payment.id.to_s
        redirect_to controller: "index", action: "index"
      else
        flash[:notice] = "paypal;fail;" + @payment.error.to_s
        redirect_to controller: "carts", action: "checkout"
      end
    else
      flash[:notice] = "checkout;fail;cannotsave"
      redirect_to controller: "carts", action: "checkout"
    end
  end
  
  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :batch_id, :shopitem_id, :shopitem_amount, :pay_amount, :selected)
    end
end
