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

ActiveRecord::Schema.define(version: 20161001123322) do

  create_table "cargos", force: :cascade do |t|
    t.integer  "codcargo"
    t.string   "nomecargo"
    t.float    "salariobase"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "filiais", force: :cascade do |t|
    t.string   "nomefilial"
    t.string   "uf"
    t.string   "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "matricula"
    t.string   "nome"
    t.string   "endereco"
    t.string   "telefone"
    t.float    "salario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sexo"
    t.date     "dtadmissao"
    t.string   "foto"
    t.integer  "setor_id"
    t.integer  "cargo_id"
  end

  add_index "funcionarios", ["cargo_id"], name: "index_funcionarios_on_cargo_id"
  add_index "funcionarios", ["setor_id"], name: "index_funcionarios_on_setor_id"

  create_table "setores", force: :cascade do |t|
    t.integer  "codsetor"
    t.string   "nomesetor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "filial_id"
  end

  add_index "setores", ["filial_id"], name: "index_setores_on_filial_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
