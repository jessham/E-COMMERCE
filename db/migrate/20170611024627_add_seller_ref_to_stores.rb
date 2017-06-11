class AddSellerRefToStores < ActiveRecord::Migration
  def change
    add_reference :stores, :seller, foreign_key: true
    add_reference :products, :store, foreign_key: true
    add_column :products, :preconormal, :decimal, null: false
    add_column :products, :precopromocional, :decimal
    add_column :products, :estoqueatual, :integer, null: false
    add_column :products, :estoquemax, :integer, null: false
  end
end
