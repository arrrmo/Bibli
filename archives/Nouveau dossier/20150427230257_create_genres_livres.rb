class CreateGenresLivres < ActiveRecord::Migration
  def change
    create_table :genres_livres do |t|
		t.integer :genre_id null: false
		t.integer :livre_id null: false
		t.references :genre
		t.references :livre
      t.timestamps null: false
    end
	add_index :genres_livres, :genre_id
    add_index :genres_livres, :livre_id
    add_index :genres_livres, [:genre_id, :livre_id], unique: true
  end
end
