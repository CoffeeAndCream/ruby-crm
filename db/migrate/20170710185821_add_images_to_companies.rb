class AddImagesToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :images, :json
  end
end
