ActiveAdmin.register Source do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :source_type

  form decorate: true do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'Sources' do
      f.input :source_type, placeholders: "Website, phone, referral, etc..."
    end
    f.actions         # adds the 'Submit' and 'Cancel'
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
