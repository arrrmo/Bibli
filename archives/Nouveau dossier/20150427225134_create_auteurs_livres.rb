class CreateAuteursLivres < ActiveRecord::Migration
  def change
    create_table :auteurs_livres do |t|
		t.integer :auteur_id null: false
		t.integer :livre_id null: false
		t.references :auteur
		t.references :livre
		t.timestamps null: false
    end
	add_index :auteurs_livres, :auteur_id
    add_index :auteurs_livres, :livre_id
    add_index :auteurs_livres, [:auteur_id, :livre_id], unique: true
  end
end
