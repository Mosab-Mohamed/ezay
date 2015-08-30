class AddRatingToComments < ActiveRecord::Migration
  def change
    add_column :comments, :rating, :integer , :default => 0
  end
end
