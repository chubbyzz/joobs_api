require 'rails_helper'

RSpec.describe Image, type: :model do
  it {should belong_to :source}
  it {should validate_presence_of :file}
end
