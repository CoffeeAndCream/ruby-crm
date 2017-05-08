class TasksController < ApplicationController
  attr_accessor :lead_id, :task_id
  def create
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.project.tasks.create(task_params)
    @lead.save
    @task = @lead.project.tasks.last
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
  def update
    @lead = Lead.find_by_id(params[:lead_id])
    @task = @lead.project.tasks.find_by_id(params[:task_id])
    @task.update(completed: params[:completed])
    @lead.save
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end
  def destroy
    @lead = Lead.find_by_id(params[:lead_id])
    @task = @lead.project.tasks.find_by_id(params[:id])
    unless @task.nil?
      @task.destroy
      respond_to do |format|
        format.js {}
        format.html {}
      end
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end
end
