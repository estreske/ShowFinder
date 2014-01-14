class BandsController < ApplicationController

  # skip_before_filter :verify_authenticity_token
  
  def new
  end

  def create 

    Band.create(name: params[:name], genre: params[:genre], hometown_city: params[:hometown_city], hometown_state: params[:hometown_state], image_url: params[:image_url], website: params[:website], user: current_user)

    redirect_to '/profile'

  end
end