json.array!(@customers) do |customer|
  json.extract! customer, :c_type, :user_id
  json.url customer_url(customer, format: :json)
end
