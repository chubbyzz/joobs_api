require 'rails_helper'

RSpec.describe Order, type: :model do
  it {should belong_to :product}
  it {should belong_to :user}

  it {should validate_numericality_of :quantity}
  it {should validate_inclusion_of(:status).in_array(%w(pending paid sent complete canceled))}
end
