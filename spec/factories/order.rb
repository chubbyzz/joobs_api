FactoryGirl.define do
  factory :order do
    quantity 1
    status 'pending'
    user
    product
  end
end