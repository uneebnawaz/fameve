class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :skill, :string
    add_column :users, :experience, :string
    add_column :users, :education, :string
    add_column :users, :certification, :string
  end
end
