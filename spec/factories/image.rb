FactoryGirl.define do
  factory :image do
    sequence(:path) {|n| Faker::Internet.url n }
    product
    main false
  end
end