class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, allow_blank: true, length: { minimum: 5}
  validates :username, presence: true, uniqueness: true
  has_many :ideas

  enum role: %w(default admin)
end
