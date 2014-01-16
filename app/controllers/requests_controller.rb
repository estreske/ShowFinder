class RequestsController < ApplicationController

  def new
    @show_id = params[:show_id]
  end

  def create
    show_id = params[:show_id]
    show = Show.find(show_id)
    band = Band.find(params[:band])
    user = show.band.user
    Request.create(show: show, band: band, user: user)
    redirect_to "/shows/#{show_id}"
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    redirect_to '/profile'
  end
end