require 'rails_helper'

RSpec.describe Address, type: :model do
  it {should belong_to :city}
  it {should belong_to :source}

  [:zipcode, :district, :street, :number, :city].each do |field|
    it {should validate_presence_of field}
  end
end
