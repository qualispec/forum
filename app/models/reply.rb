class Reply < ActiveRecord::Base
  attr_accessible :body, :user

  belongs_to :user
  belongs_to :post

  validates_presence_of :body

end