class ChangeRestrictions < ActiveRecord::Migration
  def change
    change_column :buyers, :cpf, :integer
    change_column :buyers, :cep, :integer
    change_column :buyers, :cnpj, :integer
    change_column :buyers, :numero, :integer
    change_column :buyers, :telresidencial, :integer
    change_column :buyers, :telcomercial, :integer
    change_column :buyers, :celular, :integer

    change_column :sellers, :cnpj, :integer

    change_column :stores, :telefone1, :integer
    change_column :stores, :telefone2, :integer
    change_column :stores, :numero, :integer
  end
end
