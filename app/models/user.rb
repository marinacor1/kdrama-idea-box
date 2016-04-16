class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  validates :password, length: { minimum: 8}
  validates :username, presence: true
  validates :username, uniqueness: true
  has_many :ideas
end
