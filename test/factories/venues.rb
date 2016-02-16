FactoryGirl.define do
  factory :venue do
    name "Some Venue"
    phone "39487598"
    sequence(:email) { |n| "venue-#{n}@example.com" }
    url "somevenue.com"
    address "123 Venu Stree"
    postcode "SN123"
    content "Hello World"
    archived false
  end
end
