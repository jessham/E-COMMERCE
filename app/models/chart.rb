class Chart < ActiveRecord::Base
    has_one :product
    belongs_to :buyer
end