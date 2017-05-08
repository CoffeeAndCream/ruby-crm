class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :lead, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :finish_date, null: false
      t.boolean :finished, default: false
      t.timestamps
    end
  end
end
