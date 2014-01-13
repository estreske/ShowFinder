class Band < ActiveRecord::Base
  attr_accessible :genre, :hometown_city, :hometown_state, :image_url, :name, :user_id, :user

  belongs_to :user
  has_many :shows

end
