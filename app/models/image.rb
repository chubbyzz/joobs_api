class Image < ActiveRecord::Base
  belongs_to :product

  validates :path, presence: true
  validates :path, uniqueness: true
  validate :allow_just_one_main

  def allow_just_one_main
    if ! self.product_id.nil? and
        self.main == true and
        Image.where('main = ? AND product_id = ? and id != ?', true, self.product_id, self.id).any?

      errors.add(:main, 'two main images in the same product are not allowed')
    end
  end
end
