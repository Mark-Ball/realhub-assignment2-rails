class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :status
    belongs_to :artwork, optional: true
end