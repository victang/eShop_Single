json.array!(@shopitem_images) do |shopitem_image|
  json.extract! shopitem_image, :id, :shopitem_id, :image, :descr
  json.url shopitem_image_url(shopitem_image, format: :json)
end
