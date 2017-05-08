class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :lead, foreign_key: true
      t.string :payment_type
      t.numeric :amount, :precision => 10, :scale => 2, :default => 0
      
      t.timestamps
    end
  end
end
