class Reply < ActiveRecord::Base
  attr_accessible :body, :user, :user_id, :post_id

  belongs_to :user
  belongs_to :post

  validates_presence_of :body

  def as_json(options = {})
    {
      user: user.username,
      body: body,
      post: post.title,
      created: created_at
    }
  end

end