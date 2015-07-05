json.array!(@fees) do |fee|
  json.extract! fee, :id, :price, :staff_id, :user_id
  json.url fee_url(fee, format: :json)
end
