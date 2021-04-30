class Game < ApplicationRecord
  belongs_to(:category)
  has_many :categories
end
