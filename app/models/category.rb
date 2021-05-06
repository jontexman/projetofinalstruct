class Category < ApplicationRecord
  validates :type , presence: true
  has_many :gamecategories
  has_many :games, through: :gamecategories
end
