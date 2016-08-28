require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:profile) }

  it 'should verify the profile type' do
    user = build :company_user

    expect(user.type_equals? 'Company').to be_truthy
    expect(user.type_equals? 'Applicant').to be_falsey
    expect(user.type_equals? nil).to be_falsey
  end

  it 'is a company profile' do
    user = build :company_user
    expect(user.is_company?).to be_truthy

    user = build :user
    expect(user.is_company?).to be_falsey
  end
end
