class Game < ApplicationRecord
  has_many :gamecategories
  has_many :categories, through: :gamecategories
end
