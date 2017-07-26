class RoastsController < ApplicationController

  def index

  end

  private

  def roasts
    @roasts ||= Roast.all
  end

  helper_method(:roasts)

end
