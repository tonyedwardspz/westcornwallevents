json.array!(@festivals) do |festival|
  json.extract! festival, :id, :title, :date, :end_date, :content, :image, :image_alt, :image2, :image2_alt, :video1, :video2, :meta_title, :meta_description
  json.url festival_url(festival, format: :json)
end
