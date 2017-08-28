class PaymentsController < ApplicationController
  respond_to :html, :js
  before_action :protect_read_only!, only: [:new, :edit, :create, :destroy]

  def create
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.payments.create(payment_params)
    respond_to do |format|
      format.html
      format.js { render 'leads/payments/create.js.erb'}
    end
  end
  def edit
  end
  def destroy
    @payment = Payment.find_by(id: params[:id])
    unless @payment.nil?
      @payment.destroy
    end
    respond_to do |format|
      format.html
      format.js { render 'leads/payments/destroy.js.erb'}
    end
  end

  private
  def payment_params
    params.require(:payments).permit(:id, :amount, :payment_type, :lead_id)
  end
end
