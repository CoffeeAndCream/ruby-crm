class CreateServiceOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :service_orders do |t|
      t.references :lead, foreign_key: true
      t.string :name
      t.numeric :cost
      t.text :details

      t.timestamps
    end
  end
end
