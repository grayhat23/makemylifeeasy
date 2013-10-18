json.array!(@resource_services) do |resource_service|
  json.extract! resource_service, :resource_id, :service_type_id, :service_id
  json.url resource_service_url(resource_service, format: :json)
end
