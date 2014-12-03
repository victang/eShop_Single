class Promotion < ActiveRecord::Base
  mount_uploader :image, PromotionBannersUploader
  has_many :promotion_tags
  accepts_nested_attributes_for :promotion_tags
end
