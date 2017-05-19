class ProjectsController < ApplicationController
  helper_method :sort_column, :sort_direction
  has_scope :zip, :user, :city, :fullname, :address, :city, :customer

  def new
    @lead = Lead.find_by_id(params[:lead_id])
    @project = Project.new
  end
  def edit
    @lead = Lead.find_by_id(params[:id])
    @project = @lead.project
  end
  def index
    @leads = apply_scopes(Lead.where(begin_project: true)).search(params[:search]).paginate(page: params[:page], per_page: 25)
    @leads = @leads.joins(:project).order('projects.finish_date' + ' ' + sort_direction)
  end
  def create
    @lead = Lead.find_by_id(params[:lead_id])
    @user = User.find_by_id(@lead.user_id)

    @lead.project = Project.new(project_params)
    @lead.update(begin_project: true)
    @lead.update(customer: true)

    if @lead.user.nil?
      flash.now[:warning] = "Salesperson not assigned to this project yet."
    end
    if @lead.save!
      redirect_to lead_project_path(@lead, @lead.project)
    else
      redirect_back(fallback_location: :back)
    end
  end
  def show
    @lead = Lead.find_by_id(params[:lead_id])
    @user = User.find_by_id(@lead.user_id)
    @project = @lead.project
    if (@project.finish_date < DateTime.now + 7.days)
      @project_date_color = "rgba(255,55,55, .5)"
      @project_alert = "animated flash"
    elsif ((@project.finish_date > DateTime.now + 7.days) && (@project.finish_date < DateTime.now + 14.days))
      @project_date_color = "rgba(255, 104, 0, .5)"
    else
      @project_date_color = "rgba(55,255,55, .5)"
    end
  end
  def update
    @lead = Lead.find_by_id(params[:lead_id])
    if(params[:project].has_key?(:name))
      add_task
    end
    @lead.project.update(project_params)
    redirect_to lead_project_path(@lead, @lead.project)
  end
  def destroy
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.update(begin_project: false)
    @lead.project.destroy
    redirect_to lead_projects_path
  end

  private
    def project_params
      params.require(:project).permit(:quote, :start_date, :finish_date, :id, :lead_id, :name, :details, :salesperson)
    end
end
