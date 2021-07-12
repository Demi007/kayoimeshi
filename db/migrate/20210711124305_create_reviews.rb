class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      
      t.integer :restaurant_id, null: false
      t.integer :user_id, null: false
      t.float :star, default: 0, null: false
      t.text :comment
      t.timestamps
      
    end
  end
end
