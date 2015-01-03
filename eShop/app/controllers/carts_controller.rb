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
    if !params[:cart].nil?
      if !params[:cart][:del].nil?
        params[:cart][:del].each_with_index do |c, k|
          if c == true
            @tmp_rec = Cart.where("id = ?", k)
            if !@tmp_rec.empty?
              Cart.where("id = ?", k).destory_all
            end
          end
        end 
      end
      
      if !params[:cart][:unit].nil?
        params[:cart][:unit].each_with_index do |k, c|
          
        end 
      end
    end
    redirect_to controller: "carts", action: "pending"
  end

  def check_out
    
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
