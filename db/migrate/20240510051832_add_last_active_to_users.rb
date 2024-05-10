class AddLastActiveToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_active, :timestamp
  end
end
