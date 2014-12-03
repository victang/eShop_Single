class ShopitemsController < ApplicationController
  before_action :set_shopitem, only: [:show, :edit, :update, :destroy]

  # GET /shopitems
  # GET /shopitems.json
  def index
    @shopitems = Shopitem.all
  end

  # GET /shopitems/1
  # GET /shopitems/1.json
  def show
    @shopitem_tags = @shopitem.shopitem_tags.all
    @shopitem_images = @shopitem.shopitem_images.all
  end

  # GET /shopitems/new
  def new
    @shopitem = Shopitem.new
    # @shopitem_tag = @shopitem.shopitem_tags.build
    @shopitem_image = @shopitem.shopitem_images.build
  end

  # GET /shopitems/1/edit
  def edit
  end

  # POST /shopitems
  # POST /shopitems.json
  def create
    @shopitem = Shopitem.new(shopitem_params)
    @tmp_tags = params[:shopitem][:tag]
    respond_to do |format|
      if @shopitem.save
        
        params[:shopitem_images]['image'].each do |a|
          @shopitem_image = @shopitem.shopitem_images.create(:image => a, :shopitem_id =>@shopitem.id)
        end
        
        @tmp_tags.to_s.split(';').each do |b|
          @shopitem_tags = @shopitem.shopitem_tags.create!(:tag => b, :shopitem_id => @shopitem.id)
          @shopitem_tags.save
        end
        
        format.html { redirect_to @shopitem, notice: 'Shopitem was successfully created.' }
        format.json { render :show, status: :created, location: @shopitem }
      else
        format.html { render :new }
        format.json { render json: @shopitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopitems/1
  # PATCH/PUT /shopitems/1.json
  def update
    respond_to do |format|
      if @shopitem.update(shopitem_params)
        format.html { redirect_to @shopitem, notice: 'Shopitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopitem }
      else
        format.html { render :edit }
        format.json { render json: @shopitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopitems/1
  # DELETE /shopitems/1.json
  def destroy
    @shopitem.destroy
    respond_to do |format|
      format.html { redirect_to shopitems_url, notice: 'Shopitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopitem
      @shopitem = Shopitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopitem_params
      params.require(:shopitem).permit(:code_name, :short_name, :long_name, :stock, :price, :sales, :image, :descr, shopitem_images: [:id, :shopitem_id, :image], shopitem_tags: [:id, :shopitem_id, :tag])
    end
end
