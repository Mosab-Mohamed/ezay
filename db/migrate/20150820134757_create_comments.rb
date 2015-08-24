class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :writer_name
      t.string :writer_pic_path
      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
