class AddTasksToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :lead_task, :string
    add_column :leads, :customer_task, :string
    add_column :leads, :project_task, :string
  end
end
