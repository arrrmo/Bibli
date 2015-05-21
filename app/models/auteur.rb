# == Schema Information
#
# Table name: auteurs
#
#  id            :integer          not null, primary key
#  prenom_auteur :string
#  nom_auteur    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Auteur < ActiveRecord::Base

	has_and_belongs_to_many :livres
	
	 validates :nom_auteur, presence: true#, uniqueness: { case_sensitive: false, scope: :prenom_auteur }
	 validates :prenom_auteur, presence: true#, uniqueness: { case_sensitive: false, scope: :nom_auteur}
	 
	 def self.search_auth search_term
		return Auteur.all unless search_term.present? 
		Auteur.where(['nom_auteur LIKE ? AND prenom_auteur LIKE ?  ', "%#{search_term[:nom_auteur]}%", "%#{search_term[:prenom_auteur]}%"]).all
	 end
	 
end
