class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cellar, dependent: :destroy
  has_many :slots, through: :cellar
  has_many :bottles, through: :slots
  has_one_attached :photo
end
