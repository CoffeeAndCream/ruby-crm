class CreateJobSites < ActiveRecord::Migration[5.1]
  def change
    create_table :job_sites do |t|
      t.references :lead, foreign_key: true
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :notes

      t.timestamps
    end
  end
end
