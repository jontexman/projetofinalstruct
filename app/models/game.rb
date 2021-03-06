class Game < ApplicationRecord
  validates :name, presence: true
  has_many :gamecategories
  has_many :categories, through: :gamecategories
  has_many :users, through: :game_user
  has_many :game_users
  has_many :picture
  belongs_to :publisher
end
