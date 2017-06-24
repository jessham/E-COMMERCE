class AddIntegerRestriction < ActiveRecord::Migration
  def change
    change_column :buyers, :cnpj, :bigint
    change_column :sellers, :cnpj, :bigint
  end
end
