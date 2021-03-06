json.array!(@batches) do |batch|
  json.extract! batch, :id, :code, :status, :remark, :active, :user_id, :email, :fullname, :address1, :address2, :address3, :address4, :address5, :address6, :country, :city, :phone, :user_remark
  json.url batch_url(batch, format: :json)
end
