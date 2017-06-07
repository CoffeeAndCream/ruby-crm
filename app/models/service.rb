class Service < ApplicationRecord
  validates_uniqueness_of :name

  private
  def service_name
    Service.find_by_id(service).name
  end
end
