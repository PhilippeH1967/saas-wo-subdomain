class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :fullname, :string
    add_column :users, :capacity, :integer
    add_column :users, :cost, :decimal
    add_column :users, :employee, :boolean
    add_column :users, :active, :boolean
    add_column :users, :image, :string
    add_column :users, :admin, :boolean

  end
end
