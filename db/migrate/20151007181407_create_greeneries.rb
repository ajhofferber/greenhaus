class CreateGreeneries < ActiveRecord::Migration
  def change
    create_table :greeneries do |t|
      t.integer :user_id
      t.integer :plant_id
      t.timestamps null: false
    end
  end
end
