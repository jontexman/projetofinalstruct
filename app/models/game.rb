class Game < ApplicationRecord
  validates :name, presence: true
  has_many :gamecategories
  has_many :categories, through: :gamecategories
end
