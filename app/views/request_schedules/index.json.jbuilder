json.array!(@request_schedules) do |request_schedule|
  json.extract! request_schedule, :request_id, :start_time, :end_date, :phone_number, :address, :s_type
  json.url request_schedule_url(request_schedule, format: :json)
end
