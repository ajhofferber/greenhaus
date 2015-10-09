class AddProfilePicCoumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pic_url, :string, default: 'https://s-media-cache-ak0.pinimg.com/736x/29/c6/e0/29c6e032e266ab009f2a1f884df0e331.jpg'
  end
end
