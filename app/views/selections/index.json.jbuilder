json.array!(@selections) do |selection|
  json.extract! selection, :id, :price, :user_id, :staff_id, :split, :types
  json.url selection_url(selection, format: :json)
end
