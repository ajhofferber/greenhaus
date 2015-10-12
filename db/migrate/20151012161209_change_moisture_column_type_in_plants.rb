class ChangeMoistureColumnTypeInPlants < ActiveRecord::Migration
  def change
    change_column :plants, :moisture, 'integer USING CAST(moisture AS integer)'
  end
end
