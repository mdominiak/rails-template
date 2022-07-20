class HomeController < ApplicationController
  def index
    flash.now[:notice] = "OK"
    flash.now[:alert] = "BOOM"
  end
end
