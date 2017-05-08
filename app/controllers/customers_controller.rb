class CustomersController < ApplicationController
  helper_method :sort_column, :sort_direction
  has_scope :zip, :user, :city, :fullname, :address, :city, :customer
  def index
    @customers = apply_scopes(Lead).where(:customer => true).search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 25)
  end
end
