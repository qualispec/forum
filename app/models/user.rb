class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :password, :password_confirmation, :username, :email,
                  :session_token

  has_many    :posts
  has_many    :replies
  has_many    :sent_messages,
               class_name: 'Message',
               foreign_key: :sender_id
  has_many    :received_messages,
               class_name: 'Message',
               foreign_key: :receiver_id
  belongs_to  :board, foreign_key: :moderator_id

  validates_presence_of   :username
  validates_uniqueness_of :username

  validates_presence_of   :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of     :email,
                           with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_length_of     :password, minimum: 8, on: :create

  validates_presence_of   :password_confirmation,
                           if: :check_password_confirmation?

  def check_password_confirmation?
    password
  end
end
