class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # ::trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

has_many :topics, dependent: :destroy
has_many :bookmarks, :through => :votes
has_many :votes, dependent: :destroy
end
