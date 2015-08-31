class AddUserIdAndSeenToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integers
    add_column :messages, :seen, :boolean, :default => false
  end
end
