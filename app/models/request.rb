class Request < ActiveRecord::Base
  attr_accessible :user_id, :band_id, :show_id, :user, :band, :show

  belongs_to :user
  belongs_to :band
  belongs_to :show
end
