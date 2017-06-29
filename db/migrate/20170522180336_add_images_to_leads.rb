class AddImagesToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :images, :json
  end
end
