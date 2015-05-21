
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
	# eglise = Editeur.create({nom_editeur: "Eglise Catholique"})
	# jesus= Auteur.create ({prenom_auteur: "Jesus", nom_auteur: "Christ"})
	# theologie = Genre.create ({nom_genre: "Théologie"})
	
	# bible = Livre.create(titre: 'Bible', editeur_id: eglise.id, description: 'Livre racontant plein de trucs sur Dieu', annee: '0001', langue: 'hébreu', isbn: 'ISBN 1-2345-6789-0', alire: true)
	# bible.auteurs<<jesus
	# bible.genres<<theologie
  
  
  user = User.create!(pseudo: 'arrrmo', prenom_user: 'Amaury', nom_user: 'MASSELIN', email: 'amaury.masselin@laposte.net', password: '101087@a', password_confirmation: '101087@a')