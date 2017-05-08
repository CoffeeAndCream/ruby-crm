class ServiceOrdersController < ApplicationController
  def new
  end
  def create
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.service_orders.create!(service_order_params)
    if @lead.save
      respond_to do |format|
        format.js {render '/leads/service_orders/create.js.erb'}
        format.html {}
      end
    end
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
    @lead = Lead.find_by_id(params[:lead_id])
    @service_order = @lead.service_orders.find(params[:id])
    @service_order.destroy
    if @lead.save
      respond_to do |format|
        format.js {render '/leads/service_orders/destroy.js.erb'}
        format.html {}
      end
    end
  end


  private
  def service_order_params
    params.require(:service_orders).permit(:name, :cost, :details)
  end
end
