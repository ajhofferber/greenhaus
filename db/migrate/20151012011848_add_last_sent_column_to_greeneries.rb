class AddLastSentColumnToGreeneries < ActiveRecord::Migration
  def change
    add_column :greeneries, :last_sent, :integer
  end
end
