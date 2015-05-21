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

ActiveRecord::Schema.define(version: 20150509104837) do

  create_table "auteurs", force: :cascade do |t|
    t.string   "prenom_auteur"
    t.string   "nom_auteur"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auteurs", ["nom_auteur"], name: "index_auteurs_on_nom_auteur"
  add_index "auteurs", ["prenom_auteur", "nom_auteur"], name: "index_auteurs_on_prenom_auteur_and_nom_auteur", unique: true

  create_table "auteurs_livres", id: false, force: :cascade do |t|
    t.integer "livre_id"
    t.integer "auteur_id"
  end

  add_index "auteurs_livres", ["auteur_id"], name: "index_auteurs_livres_on_auteur_id"
  add_index "auteurs_livres", ["livre_id"], name: "index_auteurs_livres_on_livre_id"

  create_table "editeurs", force: :cascade do |t|
    t.string   "nom_editeur"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "editeurs", ["nom_editeur"], name: "index_editeurs_on_nom_editeur", unique: true

  create_table "genres", force: :cascade do |t|
    t.string   "nom_genre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["nom_genre"], name: "index_genres_on_nom_genre", unique: true

  create_table "genres_livres", id: false, force: :cascade do |t|
    t.integer "livre_id"
    t.integer "genre_id"
  end

  add_index "genres_livres", ["genre_id"], name: "index_genres_livres_on_genre_id"
  add_index "genres_livres", ["livre_id"], name: "index_genres_livres_on_livre_id"

  create_table "livres", force: :cascade do |t|
    t.string   "titre"
    t.integer  "editeur_id"
    t.text     "description"
    t.integer  "annee"
    t.string   "langue"
    t.string   "isbn"
    t.boolean  "alire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "livres", ["annee"], name: "index_livres_on_annee"
  add_index "livres", ["isbn"], name: "index_livres_on_isbn", unique: true
  add_index "livres", ["langue"], name: "index_livres_on_langue"
  add_index "livres", ["titre"], name: "index_livres_on_titre", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "pseudo",                 default: "", null: false
    t.string   "prenom_user",            default: "", null: false
    t.string   "nom_user",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "role",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
