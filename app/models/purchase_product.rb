class PurchaseProduct < ActiveRecord::Base
    has_one :product
    belongs_to :purchase
end