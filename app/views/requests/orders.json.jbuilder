json.array!(@requests) do |request|
  json.extract! request, :status, :customer_id, :service_type_id, :service_id, :resource_id, :charge
  json.url request_url(request, format: :json)
end
