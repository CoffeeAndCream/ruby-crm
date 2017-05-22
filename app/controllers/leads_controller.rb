class LeadsController < ApplicationController
  helper_method :sort_column, :sort_direction
  has_scope :zip, :user, :city, :fullname, :first_name, :last_name, :address, :city, :customer


  def index
    @leads = apply_scopes(Lead).where(:customer => false).search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 25)
  end
  def show
    @lead = Lead.find_by(id: params[:id])
    @user = User.find_by_id(@lead.user_id)
  end
  def new
    authenticate_active_admin_user!
    @lead = Lead.new
  end
  def edit
    @lead = Lead.find_by(id: params[:id])
  end

  def convert
    @lead = Lead.find_by(id: params[:lead_id])
    @user = User.find_by_id(@lead.user_id)

    unless @lead.customer
      @lead.update_attributes(customer: true)
      if @user.nil?
        redirect_to :action => 'show', :id => @lead
      else
        UserMailer.lead_email(@user, @lead).deliver_now
        redirect_to :action => 'show', :id => @lead
      end
    else
      redirect_to :back, :info => @lead.fullname.to_s + ' is a contact.'
    end
  end

  def create
    @lead = Lead.new(permitted_params)
    if @lead.save
      @lead.update_attributes(created_at: DateTime.now)
      redirect_to lead_path(@lead)
    else
      @lead = Lead.where(address: params[:address])
      redirect_to new_lead_path, :danger => "A lead already exists with that name and address. <a href=" + lead_path(@lead) + ">Click</a>".html_safe
    end
  end
  def update
    @lead = Lead.find_by_id(params[:id])
    @lead.update_attributes(permitted_params)
    redirect_to :action => 'show', :id => @lead
  end
  def update_contract
    @lead = Lead.find_by_id(params[:lead][:lead_id])
    @lead.update_attributes(:contract_total => params[:lead][:contract_total])
    respond_to do |format|
      format.html {}
      format.js { render 'leads/payments/update_contract.js.erb'}
    end
  end
  def destroy
    unless authenticate_active_admin_user!
      @lead = Lead.find_by(id: params[:id])
      @lead.destroy
      redirect_to leads_path, info: "Lead destroyed"
    end
  end
  def lead_sheet
    require 'pdfkit'
    @lead = Lead.find_by_id(params[:lead_id])
    render layout: false
  end
  def tasks
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(permitted_params)
  end

  private
  def permitted_params
    params.require(:lead).permit(:first_name, :last_name, :address, :phone, :email, :lead_id, :sort_column, :sort_direction,:city,:state,:zip, :fullname, :contract_total,
    :visit_date, :comments, :page, :contacted, :visited, :begin_project, :finished_project, :send_thank_you, :user_id, :source, :lead_task, :customer_task, :project_task, :services => [])
  end

end
