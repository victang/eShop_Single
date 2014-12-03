json.array!(@shopitem_tags) do |shopitem_tag|
  json.extract! shopitem_tag, :id, :shopitem_id, :tag
  json.url shopitem_tag_url(shopitem_tag, format: :json)
end
