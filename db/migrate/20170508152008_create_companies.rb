class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_email
      t.string :company_email_password
      t.string :company_phone
      t.string :smtp_address
      t.timestamps
    end
  end
end
