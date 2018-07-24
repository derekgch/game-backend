class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games 

  has_many :words
  has_secure_password
  
  validates :user_name, presence: true, uniqueness: true
  validates :email, uniqueness: true
end
