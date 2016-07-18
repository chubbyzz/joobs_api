FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "#{Faker::Name.name} ##{n}"}
    price Faker::Number.decimal 2
  end
end