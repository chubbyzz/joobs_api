require 'rails_helper'

describe Job, type: :model do
  it {should have_many(:applications)}
  it {should belong_to(:company)}
  it {should have_many(:jobseekers).through(:applications)}

  it {should validate_presence_of :name}

  it 'should have a friendly url reference' do
    job = create(:job, name: 'test-úrl-sluGGed')
    expect(job.friendly_id).to eq 'test-url-slugged'
  end
end
