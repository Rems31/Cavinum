class Cellar < ApplicationRecord
  belongs_to :user
  has_many :slots, dependent: :destroy
  has_many :bottles, through: :slots

  after_create :generate_slots

  private

  def generate_slots
    ("A".."Z").first(width).each do |letter|
      (1..height).each do |number|
        slots.create(name: "#{letter}#{number}")
      end
    end
  end
end
