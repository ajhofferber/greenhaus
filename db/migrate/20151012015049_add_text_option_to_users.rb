class AddTextOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :text_reminder, :boolean
  end
end
