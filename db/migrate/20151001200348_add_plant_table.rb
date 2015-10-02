class AddPlantTable < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :science
      t.string :description
      t.timestamps null: false
    end
  end
end
