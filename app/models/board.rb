class Board < ActiveRecord::Base
  attr_accessible :title, :body, :moderator

  has_one :moderator, class_name: 'User', foreign_key: :user_id
  has_many :posts

  validates_presence_of :title
end
