class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = policy_scope(@conversation.messages)
    @messages.each do |message|
      unless message.user_id == current_user.id
        message.read = true
        message.save
      end
    end
    @sorted_messages = @messages.sort_by {|message| message.id}
    new
    authorize @messages
    authorize @message
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.conversation_id = @conversation.id
    @message.user_id = current_user.id
    authorize @message
    @message.save
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])

  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
