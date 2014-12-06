class IndexController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:index]
  def index
    # Fetch all suitable banners
    @banner = Promotion.where("(? BETWEEN date_from AND date_to) AND (active = ?)", Date.today, true)
    # @banner = Promotion.where("active = 1")
    # @banner = Promotion.all
    @shopitems = Shopitem.all
  end
end
