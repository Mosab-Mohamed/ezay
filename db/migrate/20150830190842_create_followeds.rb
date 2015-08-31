class CreateFolloweds < ActiveRecord::Migration
  def change
    create_table :followeds do |t|
      t.string :user_id
      t.string :followed_id

      t.timestamps null: false
    end
  end
end
