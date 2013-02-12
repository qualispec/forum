class Reply < ActiveRecord::Base
  attr_accessible :body, :user, :post_id

  belongs_to :user
  belongs_to :post

  validates_presence_of :body

end