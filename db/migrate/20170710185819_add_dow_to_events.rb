class AddDowToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :dow, :integer,  array: true, default: []
  end
end
