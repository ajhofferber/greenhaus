class ChangeDefaultLastSent < ActiveRecord::Migration
  def change
    change_column :greeneries, :last_sent, :integer, default: Time.now
  end
end
