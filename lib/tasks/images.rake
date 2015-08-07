namespace :images do
  desc "TODO"
  task process: :environment do

    Event.friendly.find_each do |e|
      e.image_link.recreate_versions! if e.image_link?
      e.save
    end

    Festival.friendly.find_each do |f|
      f.image.recreate_versions! if f.image?
      f.image2.recreate_versions! if f.image2?
      f.save
    end

    Venue.friendly.find_each do |v|
      v.image.recreate_versions! if v.image?
      v.save
    end

    puts "Processing complete"

  end

end
