class Bottle < ApplicationRecord
  belongs_to :slot
  has_one_attached :photo
end
