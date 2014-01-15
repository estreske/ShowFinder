class BandsController < ApplicationController

  # skip_before_filter :verify_authenticity_token
  
  def new
  end

  def create 

    Band.create(name: params[:name], genre: params[:genre], hometown_city: params[:hometown_city], hometown_state: params[:hometown_state], image_url: params[:image_url], website: params[:website], user: current_user)

    redirect_to '/profile'

  end

  def edit 
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    band.name = params[:name]
    band.genre = params[:genre]
    band.hometown_city = params[:hometown_city]
    band.hometown_state = params[:hometown_state]
    band.image_url = params[:image_url]
    band.website = params[:website]
    band.save!
    redirect_to '/profile'
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    redirect_to '/profile'
  end
end