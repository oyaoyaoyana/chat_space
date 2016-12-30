class AddIndexToGroupUser < ActiveRecord::Migration[5.0]
  def change
    add_index :group_user, :group_id
    add_index :group_user, :user_id
  end
end
