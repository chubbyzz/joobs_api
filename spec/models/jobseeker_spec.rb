require 'rails_helper'

RSpec.describe Jobseeker, type: :model do
  it { should have_one(:user) }
  it { should have_many(:applications)}
  it { should have_many(:jobs).through(:applications)}
end
