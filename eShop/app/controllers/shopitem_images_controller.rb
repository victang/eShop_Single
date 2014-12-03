class ShopitemImagesController < ApplicationController
  before_action :set_shopitem_image, only: [:show, :edit, :update, :destroy]

  # GET /shopitem_images
  # GET /shopitem_images.json
  def index
    @shopitem_images = ShopitemImage.all
  end

  # GET /shopitem_images/1
  # GET /shopitem_images/1.json
  def show
  end

  # GET /shopitem_images/new
  def new
    @shopitem_image = ShopitemImage.new
  end

  # GET /shopitem_images/1/edit
  def edit
  end

  # POST /shopitem_images
  # POST /shopitem_images.json
  def create
    @shopitem_image = ShopitemImage.new(shopitem_image_params)

    respond_to do |format|
      if @shopitem_image.save
        format.html { redirect_to @shopitem_image, notice: 'Shopitem image was successfully created.' }
        format.json { render :show, status: :created, location: @shopitem_image }
      else
        format.html { render :new }
        format.json { render json: @shopitem_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopitem_images/1
  # PATCH/PUT /shopitem_images/1.json
  def update
    respond_to do |format|
      if @shopitem_image.update(shopitem_image_params)
        format.html { redirect_to @shopitem_image.post, notice: 'Shopitem image was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopitem_image }
      else
        format.html { render :edit }
        format.json { render json: @shopitem_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopitem_images/1
  # DELETE /shopitem_images/1.json
  def destroy
    @shopitem_image.destroy
    respond_to do |format|
      format.html { redirect_to shopitem_images_url, notice: 'Shopitem image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopitem_image
      @shopitem_image = ShopitemImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopitem_image_params
      params.require(:shopitem_image).permit(:shopitem_id, :image, :descr)
    end
end
