class RemoveUsernameColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column    :users, :password_digest, :string
  end
end
