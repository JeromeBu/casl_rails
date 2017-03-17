class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :civility, :string
    add_column :users, :main_phone, :string
    add_column :users, :secondary_phone, :string
    add_column :users, :activity_admin, :string
    add_column :users, :admin, :boolean
  end
end
