class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      
      t.string :name
      t.text :details
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
