json.array!(@staffs) do |staff|
  json.extract! staff, :id, :name, :staff_code
  json.url staff_url(staff, format: :json)
end
