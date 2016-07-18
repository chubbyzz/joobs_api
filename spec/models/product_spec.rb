require 'rails_helper'

describe Product, type: :model do
  it {should have_many :images}
  it {should have_one :main_image}
  it {should have_many(:orders)}
  it {should have_many(:users).through(:orders)}

  it {should validate_presence_of :name}
  it {should validate_presence_of :price}
  it {should validate_numericality_of :price}

  it 'should have a friendly url reference' do
    product = create(:product, name: 'test-úrl-sluGGed')
    expect(product.friendly_id).to eq 'test-url-slugged'
  end
end
