class AddLikesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes, :integer ,:default => 0
  end
end
