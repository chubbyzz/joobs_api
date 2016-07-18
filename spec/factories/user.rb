FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) {|n| "#{n}#{Faker::Internet.email}" }
    password Faker::Lorem.sentence
    zip_code Faker::Address.zip_code
    address Faker::Address.street_address
    city Faker::Address.city
    neighborhood Faker::Address.street_suffix
    state Faker::Address.state
    number Faker::Number.number 3
  end
end