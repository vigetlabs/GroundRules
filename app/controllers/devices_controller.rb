class DevicesController < ApplicationController

  def index

  end

  private

  def devices
    @devices ||= Device.all
  end
  helper_method(:devices)

end
