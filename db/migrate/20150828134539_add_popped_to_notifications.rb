class AddPoppedToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :popped, :boolean, :default => false 
  end
end
