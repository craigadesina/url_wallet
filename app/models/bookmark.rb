class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :users, :through => :votes
  has_many :votes, dependent: :destroy
  validates :url, length: { minimum: 5 }, presence: true
  validates :topic, presence: true
end
