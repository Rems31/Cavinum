class Cellar < ApplicationRecord
  belongs_to :user
  has_many :slots, dependent: :destroy
  has_many :bottles, through: :slots
end
