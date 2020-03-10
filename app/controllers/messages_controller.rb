class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = Message.new(message_params)
    @message.conversation_id = @conversation.id
    @message.user_id = current_user.id
    authorize @message
    @message.save

    respond_to do |format|
      format.html {redirect_to conversation_path(@conversation)}
      format.js {}
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
