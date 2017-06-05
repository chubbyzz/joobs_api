class User < ActiveRecord::Base
  belongs_to :profile, polymorphic: true

  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable

  validates_presence_of :profile
  validates_associated :profile

  include DeviseTokenAuth::Concerns::User

  def type_equals? type
    self.profile_type == type
  end

  def is_company?
    self.type_equals? 'Company'
  end
end
