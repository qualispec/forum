class Post < ActiveRecord::Base
  attr_accessible :title, :body, :user

  belongs_to :user
  belongs_to :board
  has_many :replies

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :user

end