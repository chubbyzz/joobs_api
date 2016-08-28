require 'rails_helper'

RSpec.describe Application, type: :model do
  it {should belong_to :job}
  it {should belong_to :jobseeker}

  it {should validate_inclusion_of(:status).in_array(%w(pending approved reproved frozen))}
end
