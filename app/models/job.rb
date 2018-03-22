class Job < ActiveRecord::Base
  include PgSearch
  include FriendlyId

  has_many :applications
  belongs_to :company
  has_many :jobseekers, through: :applications
  # has_many :flag_sources, as: :source
  # has_many :flags, through: :flag_sources

  validates_presence_of :name

  self.per_page = 10

  friendly_id :name, use: :slugged


  pg_search_scope :text_search ,against: [:name, :slug, :small_description]
end
