json.array!(@tasks) do |event|
  json.extract! event, :id, :title, :description
  json.start event.start_date
  json.end event.end_date
  json.url task_url(event, format: :html)

  # json.color
  if event.start_date > Time.now
    json.color "#ff0000"
  else
    json.color ""
  end

end