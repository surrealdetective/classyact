class AddPasswordandSizetoSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :password_digest, :string
    add_column :surveys, :size, :integer  
    remove_column :users, :username
    add_column    :users, :password_digest, :string
  end 
end
