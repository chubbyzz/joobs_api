class Company < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :jobs
  has_one :address, as: :source

  validates_presence_of :name, :address
  validates_associated :address
end
