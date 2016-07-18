class Product < ActiveRecord::Base
  include PgSearch
  include FriendlyId

  has_many :images
  has_many :orders
  has_many :users, through: :orders
  has_one :main_image, -> {where images: {main: true}}, class_name: 'Image'

  validates :name, :price, presence: true
  validates :price, numericality: true

  self.per_page = 10

  friendly_id :name, use: :slugged

  pg_search_scope :text_search ,against: [:name, :slug]
end
