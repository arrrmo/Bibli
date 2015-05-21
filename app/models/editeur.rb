# == Schema Information
#
# Table name: editeurs
#
#  id          :integer          not null, primary key
#  nom_editeur :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Editeur < ActiveRecord::Base
	
	has_many :livres, inverse_of: :editeur
	
	validates :nom_editeur, presence: true #, uniqueness: { case_sensitive: false }
	
	def self.search_edit search_term
		return Editeur.all unless search_term.present? 
		Editeur.where(['nom_editeur LIKE ?', "%#{search_term[:nom_editeur]}%"]).all
	end
end
