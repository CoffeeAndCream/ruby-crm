class EventsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  respond_to :json
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :protect_read_only!, only: [:new, :edit, :create, :update, :destroy]

  def index
    if params[:user_id]
      @events = Event.where(start: params[:start]..params[:end]).where(user_id: params[:user_id])
    else
      @events = Event.where(start: params[:start]..params[:end]).or(Event.where('start BETWEEN ? AND ?', Date.parse(params[:start])-2.month, Date.parse(params[:end])+2.month).where.not(dow: nil))
    end
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
      params.require(:event).permit(:title, :date_range, :start, :ends, :end, :color, :user_id, :id, :description, :lead_id, :redirect_alert, :dow => [])
    end
end
