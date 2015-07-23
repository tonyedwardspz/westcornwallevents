json.array!(@admin_festivals) do |admin_festival|
  json.extract! admin_festival, :id
  json.url admin_festival_url(admin_festival, format: :json)
end
