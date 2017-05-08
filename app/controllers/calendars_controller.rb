class CalendarsController < ApplicationController
  def index
    @resources = []
    User.all.each do |user|
      @resources << {:id => user.id, :title => user.fullname}
    end
    @resources.shift
    gon.resources = @resources
  end
end
