json.array!(@festivals) do |festival|
  json.extract! festival, :id
  json.url festival_url(festival, format: :json)
end
