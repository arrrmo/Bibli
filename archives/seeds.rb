
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
	eglise = Editeur.create({nom_editeur: "Eglise Catholique"})
	jesus= Auteur.create ({prenom_auteur: "Jesus", nom_auteur: "Christ"})
	theologie = Genre.create ({nom_genre: "Théologie"})
	
	bible = Livre.create(titre: 'Bible', editeur_id: eglise.id, description: 'Livre racontant plein de trucs sur Dieu', annee: '0001', langue: 'hébreu', isbn: 'ISBN 1-2345-6789-0', alire: true)
	#RelAuteurLivre.create(auteur_id: jesus.id, livre_id: bible.id)
	#RelGenreLivre.create(genre_id: theologie.id, livre_id: bible.id)
  