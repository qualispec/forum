class Post < ActiveRecord::Base
  attr_accessible :title, :body, :user, :user_id, :board_id

  belongs_to :user
  belongs_to :board
  has_many :replies

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :user

  def last_update
    replies.any? ? replies.last.created_at : self.created_at
  end

  def as_json(options = {})
    {
      title: title,
      created: created_at,
      last_update: last_update,
      body: body,
      author: user.username,
      board: board.title,
      replies: replies
    }
    # options[:except] = [:board_id, :user_id]
    # options[:include] = [{board: board.title}, {user: user.username}]
    # super(options)
  end

end