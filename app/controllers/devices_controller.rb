class DevicesController < ApplicationController

  def index

  end

  private

  def devices
    @devices ||= Device.all.order(:position)
  end
  helper_method(:devices)

end
