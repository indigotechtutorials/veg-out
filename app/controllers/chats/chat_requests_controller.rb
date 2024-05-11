class Chats::ChatRequestsController < ApplicationController
  def index; end
  def answer
    @chat_request = ChatRequest.find(params[:id])
    @chat_request.update(accepted: params[:accepted])
    if @chat_request.accepted?
      chat = Chat.create_from_chat_request(@chat_request)
      redirect_to chat
    end
  end
end