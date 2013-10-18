json.array!(@request_histories) do |request_history|
  json.extract! request_history, :request_id, :comments, :status
  json.url request_history_url(request_history, format: :json)
end
