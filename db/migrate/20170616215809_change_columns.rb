class ChangeColumns < ActiveRecord::Migration
  def change
    change_column :buyers, :cpf, :integer, :limit => 8
    change_column :buyers, :cep, :integer, :limit => 4
    change_column :buyers, :cnpj, :integer, :limit => 8
    change_column :buyers, :numero, :integer, :limit => 4
    change_column :buyers, :telresidencial, :integer, :limit => 8
    change_column :buyers, :telcomercial, :integer, :limit => 8
    change_column :buyers, :celular, :integer, :limit => 8

    change_column :sellers, :cnpj, :integer, :limit => 8

    change_column :stores, :telefone1, :integer, :limit => 8
    change_column :stores, :telefone2, :integer, :limit => 8
    change_column :stores, :numero, :integer, :limit => 4
  end
end
