class UsersController < ApplicationController
  has_scope :zip, :user, :city, :fullname, :address, :city, :customer
  respond_to :html, :js
  before_action :protect_read_only!, only: [:new, :edit, :create, :update, :destroy]

  def show
    @resources = []
    User.all.each do |user|
      @resources.push({:id => user.id, :title => user.fullname})
    end
    gon.resources = @resources
    @user = current_user
    @leads = apply_scopes(Lead).where(:user_id => @user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    @events = Event.where(:user_id => @user).where(start: Date.today-14..Date.today+14).order(start: :asc).paginate(:page => params[:page], :per_page => 10)
    @tasks = Event.where.not(:lead_id => nil).where(:user_id => @user.id)
    gon.user = @user.id
  end
  def edit
    @user = current_user
  end
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  def leads_table
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(lead_params)
    @event = Event.find_by(:lead_id => @lead.id)
    respond_to do |format|
      format.html
      format.js { render 'users/update_tasks.js.erb' }
    end
  end
  def tasks_table
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update_attributes(lead_params)
    @event = Event.find_by(:lead_id => @lead.id)
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :address, :phone, :email, :lead_id, :sort_column, :sort_direction,:city,:state,:zip, :fullname, :contract_total, :visit_date, :comments, :page, :contacted, :visited, :begin_project, :finished_project, :send_thank_you, :user_id, :source, :lead_task, :customer_task, :project_task, :services => [])
  end
end
