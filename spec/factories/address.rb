FactoryGirl.define do
  factory :address do
    zipcode Faker::Address.postcode
    street Faker::Address.street_name
    number Faker::Address.building_number
    district Faker::Lorem.words(3)
    city
  end
end
