class AddReadOnlyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :read_only, :boolean
  end
end
