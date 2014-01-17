class BandsController < ApplicationController

  # skip_before_filter :verify_authenticity_token
  
  def new
    @band = Band.new
  end

  def create 
    @band = Band.new(params[:band])
    @band.user = current_user
    @band.save!
    redirect_to '/profile'
  end

  def edit 
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    band.update_attributes(params[:band])
    redirect_to '/profile'
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    redirect_to '/profile'
  end
end