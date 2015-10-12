class AddTextReminderColumnToGreeneries < ActiveRecord::Migration
  def change
    add_column :greeneries, :text_reminder, :boolean
  end
end
