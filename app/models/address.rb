class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :source, polymorphic: true

  validates_presence_of :district, :street, :number, :city
end
