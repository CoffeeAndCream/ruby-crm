class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :lead, foreign_key: true

      t.text :comment, null: false
      t.timestamps
    end
  end
end
