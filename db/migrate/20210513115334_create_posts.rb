class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :room
      t.string :introduce
      t.integer :fe
      t.string :image_name
      t.string :user_id
      t.integer :user_idd

      t.timestamps
    end
  end
end
