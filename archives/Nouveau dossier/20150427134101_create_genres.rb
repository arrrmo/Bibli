class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
		t.string :nom_genre null: false
		t.timestamps null: false
    end
	add_index :genres, :nom_genre, unique: true
  end
end
