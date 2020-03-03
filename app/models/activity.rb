class Activity < ApplicationRecord
  belongs_to :user
  validates :datetime, presence: true
  has_many_attached :photos
  # geocoded_by :address
  # has_many photos for cloudinary ...
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :capacity, presence: true
  validates :datetime, presence: {message: "Date cannot be blank."}

end
