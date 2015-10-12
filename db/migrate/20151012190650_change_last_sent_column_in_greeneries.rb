class ChangeLastSentColumnInGreeneries < ActiveRecord::Migration
  def change
    change_column :greeneries, :last_sent, :integer, default: 0
  end
end
