class Slot < ApplicationRecord
  belongs_to :cellar
  has_one :bottle, dependent: :destroy
end
