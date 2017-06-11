class Purchase < ActiveRecord::Base
    has_many :products
    belongs_to :buyers
end