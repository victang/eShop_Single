class PromotionTagsController < ApplicationController
  before_action :set_promotion_tag, only: [:show, :edit, :update, :destroy]

  # GET /promotion_tags
  # GET /promotion_tags.json
  def index
    @promotion_tags = PromotionTag.all
  end

  # GET /promotion_tags/1
  # GET /promotion_tags/1.json
  def show
  end

  # GET /promotion_tags/new
  def new
    @promotion_tag = PromotionTag.new
  end

  # GET /promotion_tags/1/edit
  def edit
  end

  # POST /promotion_tags
  # POST /promotion_tags.json
  def create
    @promotion_tag = PromotionTag.new(promotion_tag_params)

    respond_to do |format|
      if @promotion_tag.save
        format.html { redirect_to @promotion_tag, notice: 'Promotion tag was successfully created.' }
        format.json { render :show, status: :created, location: @promotion_tag }
      else
        format.html { render :new }
        format.json { render json: @promotion_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotion_tags/1
  # PATCH/PUT /promotion_tags/1.json
  def update
    respond_to do |format|
      if @promotion_tag.update(promotion_tag_params)
        format.html { redirect_to @promotion_tag.post, notice: 'Promotion tag was successfully updated.' }
        # format.json { render :show, status: :ok, location: @promotion_tag }
      else
        format.html { render :edit }
        format.json { render json: @promotion_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotion_tags/1
  # DELETE /promotion_tags/1.json
  def destroy
    @promotion_tag.destroy
    respond_to do |format|
      format.html { redirect_to promotion_tags_url, notice: 'Promotion tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion_tag
      @promotion_tag = PromotionTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_tag_params
      params.require(:promotion_tag).permit(:promotion_id, :tag)
    end
end
