class EventsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  respond_to :json
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end
  def show
  end
  def new
    @event = Event.new
  end
  def edit
  end
  def create
    @lead = Lead.find_by_id(params[:lead_id])
    @event = Event.new(event_params)
    @event.save
    if params[:event][:redirect_alert]
      respond_to do |format|
        format.js {render 'leads/events/create.js.erb'}
      end
    end
  end
  def update
    @event.update(event_params)
  end
  def destroy
    @event.destroy
  end


  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :ends, :end, :color, :user_id, :id, :description, :lead_id, :redirect_alert)
    end
end
