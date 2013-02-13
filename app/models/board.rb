class Board < ActiveRecord::Base
  attr_accessible :title, :body, :moderator

  has_one :moderator, class_name: 'User', foreign_key: :user_id
  has_many :posts

  validates_presence_of :title

  def sorted_posts
    posts.sort { |a,b| b.last_update <=> a.last_update}
  end

  def as_json(options = {})
    {
      title: title,
      body: body,
      threads: posts
    }
    # options[:except] = [:created_at, :updated_at]
    # super(options)
  end
end
