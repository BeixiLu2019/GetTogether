class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reviews
  validates :user, uniqueness: true
end
