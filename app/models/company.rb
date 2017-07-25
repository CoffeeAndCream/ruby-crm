class Company < ApplicationRecord
  before_create :only_one_row
  attr_accessor :images
  mount_uploader :images, ImageUploader

  private
  def only_one_row
    raise "You can create one company at a time. " + Company.first.company_name + " already exists" if Company.count > 0
  end
end
