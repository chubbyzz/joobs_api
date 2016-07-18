require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_many :orders}
  it {should have_many(:products).through(:orders)}

  it {should validate_presence_of :name}
  it {should validate_presence_of :zip_code}
  it {should validate_presence_of :address}
  it {should validate_presence_of :city}
  it {should validate_presence_of :state}
  it {should validate_presence_of :number}
  it {should validate_presence_of :neighborhood}
end
