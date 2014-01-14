class UsersController < ApplicationController 

  def profile
    @requests = Request.where(user_id: current_user.id)
  end
end