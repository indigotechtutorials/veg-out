class ChatsController < ApplicationController
  def create
    @to_user = User.find(params[:to_user_id])
    @chat_request = ChatRequest.create(user: current_user, to_user: @to_user)
    render turbo_stream: turbo_stream.replace(:chat_request, partial: "chat_request", chat_request: @chat_request)
  end
end