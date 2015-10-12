class AddMessageColumnToGreeneries < ActiveRecord::Migration
  def change
    add_column :greeneries, :message, :string, default: "Hi! Your plants love you. Don't forget to water them today. xo greenhaus."
  end
end
