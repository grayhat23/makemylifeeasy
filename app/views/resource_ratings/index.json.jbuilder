json.array!(@resource_ratings) do |resource_rating|
  json.extract! resource_rating, :resource_id, :rating, :request_id, :customer_id, :comments
  json.url resource_rating_url(resource_rating, format: :json)
end
