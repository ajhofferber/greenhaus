class AddPlantsTable < ActiveRecord::Migration

  def change
    create_table :plants do |t|
      t.string :name
      t.string :science
      t.string :description
      t.string :moisture
      t.string :sunlight
      t.text  :bio
      t.string :img_url
      t.timestamps null: false
    end
  end

end
