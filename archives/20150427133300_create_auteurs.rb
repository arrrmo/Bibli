class CreateAuteurs < ActiveRecord::Migration
  def change
    create_table :auteurs do |t|
		t.string :prenom_auteur null: false
		t.string :nom_auteur null: false
		t.timestamps null: false
    end
	add_index :auteurs, :nom_auteur
	add_index :auteurs, [:prenom_auteur, :nom_auteur], unique: true
  end
end
