class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, allow_blank: true, length: { minimum: 5}
  validates :password_confirmation, presence: true, allow_blank: true
  validates :username, presence: true, uniqueness: true
  has_many :ideas
end
