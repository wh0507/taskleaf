json.array!(@tasks) do |event|
  json.extract! event, :id, :title, :description
  json.start event.start_date
  json.end event.end_date
end