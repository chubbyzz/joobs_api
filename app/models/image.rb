class Image < ActiveRecord::Base
  belongs_to :source, polymorphic: true
  #mount_uploader :file, FileUploader

  validates :file, presence: true
end
