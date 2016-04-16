class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, presence: true
  validates :password_digest, length: { minimum: 8}
  validates :username, presence: true
  validates :username, uniqueness: true
  has_many :ideas
end
