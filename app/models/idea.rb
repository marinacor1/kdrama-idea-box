require 'fotofetch'

class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
  after_initialize :init

  def init
    self.image ||= Fotofetch::Fetch.new.fetch_links(self.title).values.pop
  end
end
