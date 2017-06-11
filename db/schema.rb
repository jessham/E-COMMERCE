# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170611200516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string   "nome",                      null: false
    t.string   "email",                     null: false
    t.integer  "cpf",                       null: false
    t.integer  "cnpj"
    t.string   "endereco",                  null: false
    t.integer  "numero",                    null: false
    t.string   "complemento",               null: false
    t.integer  "cep",                       null: false
    t.string   "bairro",                    null: false
    t.string   "cidade",                    null: false
    t.string   "uf",              limit: 2, null: false
    t.integer  "telresidencial",            null: false
    t.integer  "telcomercial"
    t.integer  "celular",                   null: false
    t.string   "password_digest",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", force: :cascade do |t|
    t.integer "quantidade"
    t.integer "product_id"
    t.integer "buyer_id"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "tipo", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "nome",             null: false
    t.string   "codigo",           null: false
    t.string   "descricao",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "store_id"
    t.decimal  "preconormal",      null: false
    t.decimal  "precopromocional"
    t.integer  "estoqueatual",     null: false
    t.integer  "estoquemax",       null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.boolean  "isconcluida", null: false
    t.boolean  "isativa",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "nome",            null: false
    t.string   "email",           null: false
    t.string   "apelido",         null: false
    t.integer  "cnpj",            null: false
    t.string   "descricao",       null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_methods", force: :cascade do |t|
    t.string   "formaentrega", null: false
    t.decimal  "fretetaxa",    null: false
    t.datetime "prazoentrega", null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.decimal  "frete",       null: false
    t.boolean  "isconcluida", null: false
    t.boolean  "isativa",     null: false
    t.datetime "dtentrega",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "nome",                 null: false
    t.integer  "telefone1",            null: false
    t.integer  "telefone2"
    t.string   "endereco",             null: false
    t.integer  "numero",               null: false
    t.string   "cidade",               null: false
    t.string   "uf",         limit: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "nometag", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "charts", "buyers"
  add_foreign_key "charts", "products"
  add_foreign_key "products", "stores"
  add_foreign_key "stores", "sellers"
end
