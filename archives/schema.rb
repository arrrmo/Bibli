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

ActiveRecord::Schema.define(version: 20150422230257) do

  create_table "auteurs", force: :cascade do |t|
    t.string   "prenom_auteur"
    t.string   "nom_auteur"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "auteurs", ["nom_auteur"], name: "index_auteurs_on_nom_auteur"
  add_index "auteurs", ["prenom_auteur", "nom_auteur"], name: "index_auteurs_on_prenom_auteur_and_nom_auteur", unique: true

  create_table "editeurs", force: :cascade do |t|
    t.string   "nom_editeur"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "editeurs", ["nom_editeur"], name: "index_editeurs_on_nom_editeur", unique: true

  create_table "genres", force: :cascade do |t|
    t.string   "nom_genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "genres", ["nom_genre"], name: "index_genres_on_nom_genre", unique: true

  create_table "livres", force: :cascade do |t|
    t.string   "titre"
    t.integer  "editeur_id"
    t.text     "description"
    t.integer  "annee"
    t.string   "langue"
    t.string   "isbn"
    t.boolean  "alire"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "livres", ["annee"], name: "index_livres_on_annee"
  add_index "livres", ["isbn"], name: "index_livres_on_isbn", unique: true
  add_index "livres", ["langue"], name: "index_livres_on_langue"
  add_index "livres", ["titre"], name: "index_livres_on_titre", unique: true

  create_table "rel_auteur_livres", force: :cascade do |t|
    t.integer  "auteur_id"
    t.integer  "livre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rel_auteur_livres", ["auteur_id", "livre_id"], name: "index_rel_auteur_livres_on_auteur_id_and_livre_id", unique: true
  add_index "rel_auteur_livres", ["auteur_id"], name: "index_rel_auteur_livres_on_auteur_id"
  add_index "rel_auteur_livres", ["livre_id"], name: "index_rel_auteur_livres_on_livre_id"

  create_table "rel_genre_livres", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "livre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rel_genre_livres", ["genre_id", "livre_id"], name: "index_rel_genre_livres_on_genre_id_and_livre_id", unique: true
  add_index "rel_genre_livres", ["genre_id"], name: "index_rel_genre_livres_on_genre_id"
  add_index "rel_genre_livres", ["livre_id"], name: "index_rel_genre_livres_on_livre_id"

end
