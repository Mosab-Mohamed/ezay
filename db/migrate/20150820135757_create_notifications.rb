class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :comment_id
      t.boolean :seen , :default => false 
      t.timestamps null: false
    end
  end
end
