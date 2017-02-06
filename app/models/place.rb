class Place < ActiveRecord::Base
  validates :title, :price, :address, presence: true
  validates :title, length: { maximum: 150 }
  validates :description, length: { maximum: 10000 }
  validates :price, numericality: { greater_than: 0 }
  validates :title, uniqueness: { case_sensitive: false }, length: { maximum: 250 }
  
  belongs_to :user
  has_many   :comments, dependent: :destroy

  geocoded_by      :address
  after_validation :geocode

  mount_uploaders :images, ImageUploader
  serialize :images, Array
  validates_presence_of :images
  validates_integrity_of :images
end
