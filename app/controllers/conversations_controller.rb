class ConversationsController < ApplicationController

  def new
    @conversation = Conversation.new
  end

  def index
    @conversations = policy_scope(Conversation).where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    authorize @conversations
  end

  def create
    @conversation = Conversation.new
    @conversation.activity_id = params[:activity_id].to_i
    @conversation.recipient_id = Activity.find(params[:activity_id]).user_id
    @conversation.sender_id = current_user.id
    @conversation.save
    authorize @conversation
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
  end

  private
    def conversation_params
      params.permit(:activity_id)
      raise
    end
end
