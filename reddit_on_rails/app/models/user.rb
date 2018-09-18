class User < ApplicationRecord
  validates_presence_of :username, :password_digest, :session_token, message: "must exist"
  validates_length_of :password, minimum: 6, allow_nil: true, message: "must be at least 6 chars"
  validates :session_token, uniqueness: true
  
  after_initialize :ensure_session_token
  
  has_many :subs,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Sub
  
  has_many :posts,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Post
  
  attr_reader :password
  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
  
  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
end