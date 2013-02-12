class Board < ActiveRecord::Base
  attr_accessible :title, :body, :moderator

  has_one :moderator, class_name: 'User', foreign_key: :user_id
  has_many :posts

  validates_presence_of :title

  def sorted_posts
    posts.sort { |a,b| b.last_update <=> a.last_update}
  end
end
