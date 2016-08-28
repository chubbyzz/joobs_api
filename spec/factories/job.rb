FactoryGirl.define do
  factory :job do
    sequence(:name) {|n| "#{Faker::Name.name} ##{n}"}
    start_salary Faker::Number.decimal 2
    until_salary Faker::Number.decimal 2
    small_description Faker::Lorem.sentence
  end
end