class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :jobseeker

  validates :status, inclusion: { in: %w(pending approved reproved frozen) }
end
