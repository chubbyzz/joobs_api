class User < ActiveRecord::Base
  validates_presence_of :name, :zip_code, :address, :city, :state, :number, :neighborhood

  has_many :products, through: :orders
  has_many :orders
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User
end
