class Request < ActiveRecord::Base
  attr_accessible :owner_id, :requester_id, :show_id, :owner, :requester, :show

  belongs_to :user
  belongs_to :show
end
