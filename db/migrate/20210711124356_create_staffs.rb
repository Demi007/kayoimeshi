class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      
      t.integer :restaurant_id, null: false
      t.string :nick_name, null: false
      t.text :introduction, null: false
      t.timestamps
      
    end
  end
end
