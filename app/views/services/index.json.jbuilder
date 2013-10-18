json.array!(@services) do |service|
  json.extract! service, :name, :image_url, :charge, :service_type_id
  json.url service_url(service, format: :json)
end
