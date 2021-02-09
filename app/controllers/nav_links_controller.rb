class NavLinksController < ApplicationController
  def index
    @links = NavLink.all
    render json: @links
  end
end
