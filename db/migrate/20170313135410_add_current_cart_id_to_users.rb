class AddCurrentCartIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_cart_id, :integer
    add_index :users, :current_cart_id
  end
end
