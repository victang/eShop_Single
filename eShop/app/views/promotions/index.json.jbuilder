json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :name, :descr, :image, :date_from, :date_to, :active
  json.url promotion_url(promotion, format: :json)
end
