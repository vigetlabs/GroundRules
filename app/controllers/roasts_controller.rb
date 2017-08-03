class RoastsController < ApplicationController

  def index

  end

  private

  def roasts
    @roasts ||= Roast.all.order(:position)
  end
  helper_method(:roasts)

end
