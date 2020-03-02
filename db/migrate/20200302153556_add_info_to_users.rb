class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :interest, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
