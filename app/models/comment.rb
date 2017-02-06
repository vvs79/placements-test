class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :body, length: { maximum: 10000 }

  belongs_to :place
  belongs_to :user

  mount_uploaders :images, ImageUploader
  serialize :images, Array
  validates_integrity_of :images
end
