class Message < ApplicationRecord
  validates :body, presence: true
  validates :conversation_id, presence: true
  validates :user_id, presence: true
  after_create :broadcast_message
  # validates :user_id

  def message_time
    created_at.strftime('%k:%M')
  end

  def broadcast_message
    ActionCable.server.broadcast("conversation_#{conversation_id}", {
      message_par: ApplicationController.renderer.render(
        partial: "conversations/message_partial",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user_id
    })
  end
end
