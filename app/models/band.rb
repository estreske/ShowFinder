class Band < ActiveRecord::Base
  attr_accessible :genre, :hometown_city, :hometown_state, :image_url, :name, :user_id, :user, :website 

  belongs_to :user
  has_many :shows

  validates :name, :hometown_state, :hometown_city, :genre, :website, presence: true

end
