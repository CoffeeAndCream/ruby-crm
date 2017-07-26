class ReportsController < ApplicationController
  before_action :authenticate_active_admin_user!
  def index
    @data = Lead.group_by_week(:created_at, last: 6).count
  end
  def create
    begin_date = params[:dates][:begin_date]
    end_date = params[:dates][:end_date]
    weeks = ((Date.parse(end_date) - Date.parse(begin_date)).to_i/7)
    @data = Lead.where('created_at BETWEEN ? AND ?', Date.parse(begin_date), Date.parse(end_date)).group_by_week(:created_at, last: weeks).count
    unless @data.nil? || @data.empty?
      respond_to do |format|
        format.js { render 'date_update.js.erb'}
      end
    else
      redirect_to :back, info: 'Error, no data available for this time period!'
    end
  end
end
