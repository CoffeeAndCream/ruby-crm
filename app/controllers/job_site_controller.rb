class JobSiteController < ApplicationController
  def new
    @job_site = JobSite.new
  end
  def create
    @job_site = JobSite.new(job_site_params)
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.job_site = @job_site
    @lead.save
    redirect_to lead_path(@lead)
  end
  def show
    @job_site = JobSite.find_by_id(params[:id])
  end
  def edit
    @job_site = JobSite.find_by_id(params[:id])
  end
  def update
    @job_site = JobSite.find_by_id(params[:id])
    @job_site.update_attributes(job_site_params)
    respond_to do |format|
      format.html
      format.js { render 'leads/job_site/create.js.erb'}
    end
  end
  def destroy
    @job_site = JobSite.find_by_id(params[:id])
  end

  private
  def job_site_params
    params.require(:job_site).permit(:id, :address, :city, :state, :zip, :notes, :lead_id)
  end
end
