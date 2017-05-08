class Company < ApplicationRecord
  before_create :only_one_row
  private
  def only_one_row
    raise "You can create one company at a time. " + Company.first.company_name + " already exists" if Company.count > 0
  end
end
