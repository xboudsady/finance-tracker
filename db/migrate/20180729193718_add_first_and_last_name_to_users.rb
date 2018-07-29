class AddFirstAndLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string   # Adding column to the 'users' table with 'first_name'
    add_column :users, :last_name, :string    # Adding column to 'users' table
  end
end
