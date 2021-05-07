class Category < ApplicationRecord
  validates :name , presence: true
  has_many :gamecategories
  has_many :games, through: :gamecategories
end
