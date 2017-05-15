class CalendarsController < ApplicationController
  def index
    @resources = []
    User.all.each do |user|
      @resources.push({:id => user.id, :title => user.fullname})
    end
    gon.resources = @resources
  end
end
