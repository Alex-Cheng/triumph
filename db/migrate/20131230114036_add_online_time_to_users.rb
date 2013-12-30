class AddOnlineTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :online_time, :integer
  end
end
