class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :nome, null: false
      t.integer :telefone1, null: false
      t.integer :telefone2
      t.string :endereco, null: false
      t.integer :numero, null: false
      t.string :cidade, null: false
      t.string :uf, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :purchases do |t|
      t.boolean :isconcluida, null: false
      t.boolean :isativa, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :shippings do |t|
      t.decimal :frete, null: false
      t.boolean :isconcluida, null: false
      t.boolean :isativa, null: false
      t.datetime :dtentrega, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :payment_types do |t|
      t.string :tipo, null: false
    end

    create_table :shipping_methods do |t|
      t.string :formaentrega, null: false
      t.decimal :fretetaxa, null: false
      t.datetime :prazoentrega, null: false
    end
  end
end
