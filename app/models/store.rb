class Store < ActiveRecord::Base
    belongs_to :seller
    has_many :products
end