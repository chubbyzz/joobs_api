class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :quantity, numericality: true
  validates :status, inclusion: { in: %w(pending paid sent complete canceled) }
end
