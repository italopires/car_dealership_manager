class Dealership < ApplicationRecord
  has_many :cars

  validates :name, presence: true

  def to_s
    name
  end
end