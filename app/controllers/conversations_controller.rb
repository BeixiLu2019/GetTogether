class ConversationsController < ApplicationController

  def index
    @current_page = "messages"
    all_conversations = policy_scope(Conversation).where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    @conversations = all_conversations.select{|conversation| Activity.find(conversation.activity_id).datetime > DateTime.now()}
  end

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @messages = policy_scope(@conversation.messages)
    @messages.each do |message|
      unless message.user_id == current_user.id
        message.read = true
        message.save
      end
    end
    @sorted_messages = @messages.sort_by {|message| message.id}
    @message = Message.new
    # authorize @message
  end

  def create
    # if for this activity a conversation with the same sender_id (user) exists
    if Conversation.where(["activity_id= ? and sender_id = ?", params[:activity_id], current_user.id]).first.present?
      @conversation = Conversation.where(["activity_id= ? and sender_id = ?", params[:activity_id], current_user.id]).first
    else
      @conversation = Conversation.new
      @conversation.activity_id = params[:activity_id].to_i
      @conversation.recipient_id = Activity.find(params[:activity_id]).user_id
      @conversation.sender_id = current_user.id
      @conversation.save
    end
    authorize @conversation
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
  end

end
