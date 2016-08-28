FactoryGirl.define do
  factory :application do
    status 'pending'
    user
    job
  end
end