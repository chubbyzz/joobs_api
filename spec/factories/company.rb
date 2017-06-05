FactoryGirl.define do
  factory :company do
    name Faker::Name.name
    address
  end
end
