class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :source_type
      t.timestamps
    end
  end
end
