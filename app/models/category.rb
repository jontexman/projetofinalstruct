class Category < ApplicationRecord
  belongs_to(:game)
  has_many :games

end
