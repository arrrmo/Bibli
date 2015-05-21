class CreateLivres < ActiveRecord::Migration
  def change
    create_table :livres do |t|
		t.string :titre null: false
		t.integer :editeur_id null: false
		t.text :description null: false
		t.integer :annee null: false
		t.string :langue null: false
		t.string :isbn null: false
		t.boolean :alire null: false
		t.timestamps null: false
    end
	
	add_index :livres, :langue
	add_index :livres, :annee
	add_foreign_key :livres, :editeurs, name: :editeur_id
	add_index :livres, :titre, unique: true
	add_index :livres, :isbn, unique: true
end
end
		
	      
		  