class Activity < ApplicationRecord
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :search, against: [:name, :description, :category, :address]
  validates :datetime, presence: true
    geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # geocoded_by :address
  # has_many photos for cloudinary ...
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :capacity, presence: true
  validates :datetime, presence: {message: "Date cannot be blank."}

end
