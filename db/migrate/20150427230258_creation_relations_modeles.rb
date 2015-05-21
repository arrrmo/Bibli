class CreationRelationsModeles < ActiveRecord::Migration
  def change
		create_table :livres do |t|
		t.string :titre 
		t.integer :editeur_id 
		t.text :description 
		t.integer :annee 
		t.string :langue 
		t.string :isbn 
		t.boolean :alire
		t.timestamps
    end
	
	add_index :livres, :langue
	add_index :livres, :annee
	add_foreign_key :livres, :editeurs, name: :editeur_id
	add_index :livres, :titre, unique: true
	add_index :livres, :isbn, unique: true
	
	create_table :genres_livres, id: false do |t|
	t.belongs_to :livre, index: true
	t.belongs_to :genre, index: true
    end
	
	create_table :auteurs_livres, id: false do |t|
		t.belongs_to :livre, index: true
	    t.belongs_to :auteur, index: true
    end

	create_table :auteurs do |t|
		t.string :prenom_auteur
		t.string :nom_auteur 
		t.timestamps 
    end
	add_index :auteurs, :nom_auteur
	add_index :auteurs, [:prenom_auteur, :nom_auteur], unique: true
	
	create_table :genres do |t|
	t.string :nom_genre 
	t.timestamps 
    end
	add_index :genres, :nom_genre, unique: true

	create_table :editeurs do |t|
		t.string :nom_editeur
		t.timestamps 
    end
	add_index :editeurs, :nom_editeur, unique: true
	
	
  end
end
