class Company < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :jobs
end
