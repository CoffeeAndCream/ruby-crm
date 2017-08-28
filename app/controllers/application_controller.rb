class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_filter :request_filter
  before_action :authenticate_user!
  before_action :set_time_zone, if: :authenticate_user!

  protect_from_forgery with: :null_session
  layout :determine_layout
  add_flash_types :danger, :info, :warning, :success
  helper_method :sort_column, :sort_direction

  protected
  def authenticate_active_admin_user!
     authenticate_user!
     unless current_user.role?(:admin)
        redirect_to root_path, :info => "Only administrators can use this feature."
     end
  end
  def protect_read_only!
    if current_user.role?("read only")
      redirect_to :back, info: 'Sorry, you can\'t make changes to that'
    end
  end
  def after_sign_in_path_for(resource)
    leads_path
  end
  def access_denied(exception)
      redirect_to root_path
  end
  def determine_layout
    current_user ? "application" : "public"
  end
  def json_request?
    request.format.json?
  end


  def request_filter
     $request = request
  end

  private

  def set_time_zone
  #Time.zone = current_user.time_zone
  end

  def sort_column
    Lead.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
