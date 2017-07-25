ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :company_name, :company_email, :company_email_password, :company_phone, :smtp_address, :images
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
  # end
  index do
      column :company_name
      column :company_email
      column :company_phone
      column :smtp_address
      actions
  end
  form do |f|
    f.inputs :company_name
    f.inputs :company_email
    f.inputs :company_email_password
    f.inputs :company_phone
    f.inputs :smtp_address
    f.file_field :images, as: :file, label: 'Company Logo'

    actions

  end
end
