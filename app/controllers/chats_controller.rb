class ChatsController < ApplicationController
  before_action :set_chat, :authorize_chat_user, only: [:show]
  def create
    @to_user = User.find(params[:to_user_id])
    @chat_request = ChatRequest.create(user: current_user, to_user: @to_user)
    render turbo_stream: turbo_stream.replace("chat-request", partial: "profile/chat_request", locals: { chat_request: @chat_request })
  end

  def show
    
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def authorize_chat_user
    redirect_to root_path, alert: "You are not authorized to view this chat sorry :P" unless @chat.chat_users.where(user: current_user).first.present?
  end
end