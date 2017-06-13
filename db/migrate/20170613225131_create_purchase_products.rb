class CreatePurchaseProducts < ActiveRecord::Migration
  def change
    create_table :purchase_products do |t|
      
    end

    add_reference :purchase_products, :purchase, foreign_key: true

    add_reference :purchase_products, :product, foreign_key: true

    add_reference :purchases, :buyer, foreign_key: true
  end
end
