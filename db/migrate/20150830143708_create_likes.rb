class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :rated_id
      t.string :category
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
