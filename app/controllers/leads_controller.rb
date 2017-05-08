class LeadsController < ApplicationController
  helper_method :sort_column, :sort_direction
  has_scope :zip, :user, :city, :fullname, :address, :city, :customer


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
    unless @lead.customer
      @lead.update_attributes(customer: true)
      redirect_to :action => 'show', :id => @lead
    else
      redirect_to :back, :info => @lead.fullname.to_s + ' is already a contact.'
    end
  end

  def create
    @lead = Lead.new(permitted_params)
    @lead.save!
    @lead.update_attributes(created_at: DateTime.now)
    redirect_to lead_path(@lead)
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
  def contacted
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(:contacted => params[:contacted])
    @lead.save
    @leads = apply_scopes(Lead).where(:user_id => current_user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html {}
      format.js { render '/users/update_table.js.erb'}
    end
  end
  def closed
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(:closed => params[:closed])
    @lead.save
    @leads = apply_scopes(Lead).where(:user_id => current_user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html {}
      format.js { render '/users/update_table.js.erb'}
    end
  end
  def begin_project
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(:begin_project => params[:begin_project])
    @lead.save
    @leads = apply_scopes(Lead).where(:user_id => current_user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html {}
      format.js { render '/users/update_table.js.erb'}
    end
  end
  def send_thank_you
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(:send_thank_you => params[:send_thank_you])
    @lead.save
    @leads = apply_scopes(Lead).where(:user_id => current_user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html {}
      format.js { render '/users/update_table.js.erb'}
    end
  end
  def finished_project
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(:finished_project => params[:finished_project])
    @lead.save
    @leads = apply_scopes(Lead).where(:user_id => current_user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html {}
      format.js { render '/users/update_table.js.erb'}
    end
  end
  def destroy
    @lead = Lead.find_by(id: params[:id])
    @lead.destroy
    redirect_to leads_path
  end
  def lead_sheet
    @lead = Lead.find_by(id: params[:lead_id])
    render layout: false
  end
  private
  def permitted_params
    params.require(:lead).permit(:first_name, :last_name, :address, :phone, :email, :lead_id, :sort_column, :sort_direction,:city,:state,:zip, :fullname, :contract_total,
    :visit_date, :comments, :page, :contacted, :visited, :begin_project, :finished_project, :send_thank_you, :user_id, :source, :services => [])
  end

end
