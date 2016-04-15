class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  validates :password, presence: true
  validates :password, length: { minimum: 8}
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_confirmation, presence: true
end
