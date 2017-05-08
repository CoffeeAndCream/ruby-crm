class Event < ApplicationRecord
  attr_accessor :date_range, :redirect_alert
  belongs_to :lead

  def all_day_event?
    self.start == self.start.midnight && self.ends == self.ends.midnight ? true : false
  end
end
