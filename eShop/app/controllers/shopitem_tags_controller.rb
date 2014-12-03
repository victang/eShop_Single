class ShopitemTagsController < ApplicationController
  before_action :set_shopitem_tag, only: [:show, :edit, :update, :destroy]

  # GET /shopitem_tags
  # GET /shopitem_tags.json
  def index
    @shopitem_tags = ShopitemTag.all
  end

  # GET /shopitem_tags/1
  # GET /shopitem_tags/1.json
  def show
  end

  # GET /shopitem_tags/new
  def new
    @shopitem_tag = ShopitemTag.new
  end

  # GET /shopitem_tags/1/edit
  def edit
  end

  # POST /shopitem_tags
  # POST /shopitem_tags.json
  def create
    @shopitem_tag = ShopitemTag.new(shopitem_tag_params)

    respond_to do |format|
      if @shopitem_tag.save
        format.html { redirect_to @shopitem_tag, notice: 'Shopitem tag was successfully created.' }
        format.json { render :show, status: :created, location: @shopitem_tag }
      else
        format.html { render :new }
        format.json { render json: @shopitem_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopitem_tags/1
  # PATCH/PUT /shopitem_tags/1.json
  def update
    respond_to do |format|
      if @shopitem_tag.update(shopitem_tag_params)
        format.html { redirect_to @shopitem_tag, notice: 'Shopitem tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopitem_tag }
      else
        format.html { render :edit }
        format.json { render json: @shopitem_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopitem_tags/1
  # DELETE /shopitem_tags/1.json
  def destroy
    @shopitem_tag.destroy
    respond_to do |format|
      format.html { redirect_to shopitem_tags_url, notice: 'Shopitem tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopitem_tag
      @shopitem_tag = ShopitemTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopitem_tag_params
      params.require(:shopitem_tag).permit(:shopitem_id, :tag)
    end
end
