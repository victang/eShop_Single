class ShopitemImage < ActiveRecord::Base
  mount_uploader :image, ShopitemUploader
  belongs_to :shopitem
end
