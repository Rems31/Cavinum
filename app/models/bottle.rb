class Bottle < ApplicationRecord
  belongs_to :slot
  has_one_attached :photo

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: ["Blanc", "Rouge", "Rosé"] }
  validates :slot, presence: true
end
