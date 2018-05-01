class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user
      t.references :lead, foreign_key: true
      t.string :title
      t.datetime :start
      t.datetime :ends
      t.string :color, default: "#428bca"
      t.text :description
      t.timestamps
    end
  end
end
