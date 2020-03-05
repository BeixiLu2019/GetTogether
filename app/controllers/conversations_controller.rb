class ConversationsController < ApplicationController

  def new
    @conversation = Conversation.new
  end

  def index
    @conversations = policy_scope(Conversation).where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    authorize @conversations
  end

  def create
    @conversation = Conversation.create!(conversation_params)
    authorize @conversation
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id, :activity_id)
    end
end
