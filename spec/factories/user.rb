FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) {|n| "#{n}#{Faker::Internet.email}" }
    password Faker::Lorem.sentence
  end

  factory :company_user, class: 'User' do
    name Faker::Name.name
    sequence(:email) {|n| "#{n}#{Faker::Internet.email}" }
    password Faker::Lorem.sentence
    association :profile, factory: :company
  end
end