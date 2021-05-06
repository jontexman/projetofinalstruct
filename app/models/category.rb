class Category < ApplicationRecord
  has_many :gamecategories
  has_many :games, through: :gamecategories
end
