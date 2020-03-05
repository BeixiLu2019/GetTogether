class Activity < ApplicationRecord
  belongs_to :user
  has_many :conversations
  # has_many :users, through: :bookings
  include PgSearch::Model
  pg_search_scope :search, against: [:name, :description]
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :datetime, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # has_many photos for cloudinary ...
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :capacity, presence: true
  validates :datetime, presence: {message: "Date cannot be blank."}
  # validates :user, uniqueness: true
end
