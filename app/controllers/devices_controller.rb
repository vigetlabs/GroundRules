class DevicesController < ApplicationController

  def index

  end

  def show
    @device ||= Device.find_by(slug: params[:id])
  end

  private

  def devices
    @devices ||= Device.all
  end
  helper_method(:devices)

end
