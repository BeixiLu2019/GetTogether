class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :activities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }, uniqueness: true

end
