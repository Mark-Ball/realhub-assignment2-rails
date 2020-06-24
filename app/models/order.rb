class Order < ApplicationRecord
    belongs_to :agency
    belongs_to :campaign
    has_many :order_items
end