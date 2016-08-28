class Jobseeker < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :jobs, through: :applications
  has_many :applications
end
