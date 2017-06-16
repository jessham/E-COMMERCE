class ChangeLimit < ActiveRecord::Migration
  def change
    change_column :buyers, :cpf, :integer, :limit => 8
  end
end
