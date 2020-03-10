class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reviews, dependent: :destroy
  #validates :user, uniqueness: true
  validate :unique_activity
  validate :capacity_limit
  #should only create a booking if the activity hasnt been booked by the user already
  def unique_activity
    if self.user.bookings.where(activity_id: self.activity.id).any?
      errors.add(:already_joined, "this activity!")
    end
  end

  def capacity_limit
    if (self.activity.capacity - self.activity.bookings.count) <= 0
      errors.add(:no_spaces, "left!")
    end
  end
end
