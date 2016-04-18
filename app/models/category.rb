class Category < ActiveRecord::Base
  validates :genre, presence: true 
  has_many :ideas
end
