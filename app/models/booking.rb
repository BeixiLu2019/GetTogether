class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  # validates :user, uniqueness: true
end
