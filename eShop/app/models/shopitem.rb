class Shopitem < ActiveRecord::Base
  mount_uploader :image, ShopitemUploader 
  has_many :shopitem_tags
  accepts_nested_attributes_for :shopitem_tags
  has_many :shopitem_images
  accepts_nested_attributes_for :shopitem_images
end
