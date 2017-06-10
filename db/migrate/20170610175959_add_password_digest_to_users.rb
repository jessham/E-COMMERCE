class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :senha, :string
    add_column :users, :password_digest, :string
  end
end
