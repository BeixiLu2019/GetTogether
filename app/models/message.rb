class Message < ApplicationRecord
  validates :body, presence: true
  validates :conversation_id, presence: true
  validates :user_id, presence: true
  # validates :user_id

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
