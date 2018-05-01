class AddImagesToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :images, :json
  end
end
