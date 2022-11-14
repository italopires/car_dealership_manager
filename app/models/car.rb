class Car < ApplicationRecord
  extend Enumerize
  belongs_to :dealership

  validates :name, :dealership_id, :price, :status, presence: true

  enumerize :status, in: { new: 1, used: 2 }
end