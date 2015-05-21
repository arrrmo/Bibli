class CreateEditeurs < ActiveRecord::Migration
  def change
    create_table :editeurs do |t|
		t.string :nom_editeur null: false
		t.timestamps null: false
    end
	add_index :editeurs, :nom_editeur, unique: true
  end
end
