require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_one(:user) }
  it { should have_many(:jobs)}
  it { should have_one(:address)}
end
