class AddBuyerRefToCharts < ActiveRecord::Migration
  def change
    add_reference :charts, :product, foreign_key: true
    add_reference :charts, :buyer, foreign_key: true
  end
end
