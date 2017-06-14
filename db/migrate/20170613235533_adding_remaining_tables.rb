class AddingRemainingTables < ActiveRecord::Migration
  def change
    create_table :seller_classifications do |t|
      t.integer :nota, null: false
      t.string :comentario, null:false
      t.boolean :isativo
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :comments do |t|
      t.string :titulo, null: false
      t.string :conteudo, null:false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :favorites do |t|
      
    end

    create_table :product_tags do |t|
      
    end

    create_table :store_tags do |t|
      
    end
  end
end
