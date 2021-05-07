class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :games
  acts_as_token_authenticatable

  validates :name,presence: true
  validates :email,presence: true
  validates :encrypted_password,presence: true

  has_one_attached :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
