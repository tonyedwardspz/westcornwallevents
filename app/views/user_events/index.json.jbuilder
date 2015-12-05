json.array!(@user_events) do |user_event|
  json.extract! user_event, :id, :title, :date, :end_date, :location, :link, :image, :time, :description
  json.url user_event_url(user_event, format: :json)
end
