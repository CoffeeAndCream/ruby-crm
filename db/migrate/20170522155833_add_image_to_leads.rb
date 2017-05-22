class AddImageToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :image, :string
  end
end
