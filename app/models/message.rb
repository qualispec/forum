class Message < ActiveRecord::Base
  attr_accessible :body, :receiver

  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id

  validates_presence_of :body
  validates_presence_of :receiver
end