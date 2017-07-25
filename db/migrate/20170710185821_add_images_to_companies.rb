class AddImagesToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :images, :json
  end
end
