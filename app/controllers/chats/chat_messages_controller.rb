class Chats::ChatMessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @chat_message = @chat.chat_messages.create(user: current_user, message: params[:message])
    @chat.broadcast_append_to(@chat, target: "chat-messages", partial: "chats/chat_message", locals: { chat_message: @chat_message })
    @chat.broadcast_update_to(@chat, target: "chat-form", partial: "chats/form", locals: { chat: @chat })
    head :ok
  end
end