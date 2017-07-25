class ReportsController < ApplicationController
  before_action :authenticate_active_admin_user!
end
