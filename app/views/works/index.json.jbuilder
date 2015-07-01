json.array!(@works) do |work|
  json.extract! work, :id, :user_id, :staff_id, :start_work, :end_word, :image
  json.url work_url(work, format: :json)
end
