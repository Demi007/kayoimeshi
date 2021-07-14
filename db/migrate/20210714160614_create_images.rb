class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :restaurant_id, null: false
      t.string :img_id, null: false

      t.timestamps
    end
  end
end
