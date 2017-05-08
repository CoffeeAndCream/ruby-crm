class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.references :user
      #Real info / data
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :services, array: true, default: nil
      t.datetime :visit_date
      t.datetime :created_at
      t.string :source
      t.numeric :contract_total, :precision => 10, :scale => 2, :default => 0

      t.boolean :begin_project, default: false
      t.boolean :finished_project, default: false

      #"switches" to help filter through lead data
      t.boolean :contacted, default: false
      t.boolean :closed, default: false
      t.boolean :customer, default: false
      t.boolean :send_thank_you, default: false

      t.timestamps
    end
  end
  def self.down
    drop_table :leads
  end
end
