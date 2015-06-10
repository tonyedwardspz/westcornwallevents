json.array!(@venues) do |venue|
  json.extract! venue, :ido, :name, :phone, :email, :url, :address, :postcode, :image, :image_alt, :content
  json.url venue_url(venue, format: :json)
end
