class CreateTables < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :apelido, null: false
      t.integer :cnpj, null: false
      t.string :descricao, null: false
      t.string :password_digest, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :buyers do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.integer :cpf, null: false
      t.integer :cnpj
      t.string :endereco, null: false
      t.integer :numero, null: false
      t.string :complemento, null: false
      t.integer :cep, null: false
      t.string :bairro, null: false
      t.string :cidade, null: false
      t.string :uf, null: false
      t.integer :telresidencial, null: false
      t.integer :telcomercial
      t.integer :celular, null: false
      t.string :password_digest, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :charts do |t|
      t.integer :quantidade
    end

    create_table :products do |t|
      t.string :nome, null: false
      t.string :codigo, null: false
      t.string :descricao, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :tags do |t|
      t.string :nometag, null: false
    end
  end
end
