ActiveAdmin.register Lead do
  active_admin_import

  permit_params :first_name, :last_name, :email, :phone, :address, :service, :quote, :user, :city, :zip, :state
  remove_filter :services, :created_at, :quote, :job_site, :events, :payments, :comments, :photos, :service_orders, :visit_date, :begin_project, :finished_project, :contacted, :closed, :send_thank_you, :contract_total
  preserve_default_filters! # build the default filters
  filter :user, :collection => proc {(User.all).map{|c| [c.fullname, c.id]}} # remove a default filter



  index do
    selectable_column
    id_column
    column :first_name, :null => false
    column :last_name, :null => false
    column :email
    column :phone
    column :address
    column :services
    column :quote
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    inputs :first_name, :last_name, :email, :phone, :address, :city, :state, :zip, :services
    f.collection_select(:user_id, User.all.where.not(:first_name => nil), :fullname, :fullname, :label => "Salesperson", :class => "form-group form-control")
    f.actions         # adds the 'Submit' and 'Cancel'
  end

  show do
    attributes_table do
      row :first_name, :null => false
      row :last_name, :null => false
      row :email
      row :phone
      row :address
      row :service
      row :salesperson
      row :quote
    end
    #render 'leads/show', layout: "active_admin" --> THIS WOULD PRESENT AN 'edit quote' ABILITY.


    active_admin_comments
    end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
