class Order < ApplicationRecord
    belongs_to :agency
    belongs_to :campaign
    belongs_to :status
end