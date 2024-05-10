class CreateChatRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_requests do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :to_user, null: false, foreign_key: { to_table: :users }
      t.boolean :accepted

      t.timestamps
    end
  end
end
