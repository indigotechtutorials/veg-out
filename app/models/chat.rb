class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :chat_messages, dependent: :destroy

  def self.create_from_chat_request(chat_request)
    chat = create
    chat.chat_users.create(user: chat_request.user)
    chat.chat_users.create(user: chat_request.to_user)
    chat
  end
end
