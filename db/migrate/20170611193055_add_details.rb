class AddDetails < ActiveRecord::Migration
  def change
    change_column :buyers, :cpf, :integer, :precision => 11
    change_column :buyers, :cep, :integer, :precision => 8
    change_column :buyers, :cnpj, :integer, :precision => 14
    change_column :buyers, :numero, :integer, :precision => 6
    change_column :buyers, :uf, :string, :limit => 2
    change_column :buyers, :telresidencial, :integer, :precision => 11
    change_column :buyers, :telcomercial, :integer, :precision => 11
    change_column :buyers, :celular, :integer, :precision => 11

    change_column :sellers, :cnpj, :integer, :precision => 14

    change_column :stores, :telefone1, :integer, :precision => 11
    change_column :stores, :telefone2, :integer, :precision => 11
    change_column :stores, :numero, :integer, :precision => 6
    change_column :stores, :uf, :string, :limit => 2
  end
end
