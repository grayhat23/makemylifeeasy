json.array!(@resources) do |resource|
  json.extract! resource, :user_id, :r_type, :average_rating
  json.url resource_url(resource, format: :json)
end
