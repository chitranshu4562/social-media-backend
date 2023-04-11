class AddUserIdToPlace < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :user_id, :bigint
  end
end
