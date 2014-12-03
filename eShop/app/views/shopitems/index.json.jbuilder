json.array!(@shopitems) do |shopitem|
  json.extract! shopitem, :id, :code_name, :short_name, :long_name, :stock, :price, :sales, :image, :descr
  json.url shopitem_url(shopitem, format: :json)
end
