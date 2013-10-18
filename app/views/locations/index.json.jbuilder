json.array!(@locations) do |location|
  json.extract! location, :name, :phone_number, :address, :user_id
  json.url location_url(location, format: :json)
end
