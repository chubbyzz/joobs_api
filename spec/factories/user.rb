FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "#{n}#{Faker::Internet.email}" }
    password Faker::Lorem.sentence
  end

  factory :company_user, class: 'User' do
    sequence(:email) {|n| "#{n}#{Faker::Internet.email}" }
    password Faker::Lorem.sentence
    association :profile, factory: :company
  end
end
