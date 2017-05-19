class CalendarsController < ApplicationController
  def index
    authenticate_active_admin_user!
    @lead = Lead.find_by_id(params[:lead_id])
    gon.lead = @lead
    @resources = []
    User.all.each do |user|
      @resources.push({:id => user.id, :title => user.fullname})
    end
    gon.resources = @resources
  end
end
