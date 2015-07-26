class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :users, :through => :votes
  has_many :votes, dependent: :destroy
end
