class ChangeDefaultLastSentColumn < ActiveRecord::Migration
  def change
    change_column :greeneries, :last_sent, :integer
  end
end
