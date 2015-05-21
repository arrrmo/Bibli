# == Schema Information
#
# Table name: livres
#
#  id          :integer          not null, primary key
#  titre       :string
#  editeur_id  :integer
#  description :text
#  annee       :integer
#  langue      :string
#  isbn        :string
#  alire       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Livre < ActiveRecord::Base
	
	belongs_to :editeur, inverse_of: :livres
	has_and_belongs_to_many :auteurs
	has_and_belongs_to_many :genres
	accepts_nested_attributes_for :auteurs
	accepts_nested_attributes_for :editeur
	accepts_nested_attributes_for :genres
	validates :titre, presence: true, uniqueness: { case_sensitive: false }
	#validates :editeur_id, presence: true
	validates :description, presence: true
	validates :langue, presence: true
	validates :annee, numericality: { only_integer: true }
	validates :isbn, presence: true, uniqueness: { case_sensitive: false }
	#validates :alire, presence: true, inclusion: { in: [true, false] }
	
	def self.search_book search_term
	  return Livre.all unless search_term.present? 
	  if  search_term[:titre].present?
	  Livre.where(['titre LIKE ?', "%#{search_term[:titre]}%"]).all
	  elsif search_term[:isbn].present?
		Livre.where(['isbn = ?', "#{search_term[:isbn]}"]).all
		elsif search_term[:langue].present?
		Livre.where(['langue = ?', "#{search_term[:langue]}"]).all
		elsif search_term[:annee].present?
		Livre.where(['annee = ?', "#{search_term[:annee]}"]).all
	   elsif search_term[:nom_auteur].present?
		Livre.joins(:auteurs).where(['nom_auteur  = ? AND prenom_auteur = ?  ', "#{search_term[:nom_auteur]}", "#{search_term[:prenom_auteur]}"]).all
	   elsif search_term[:nom_editeur].present?
			edit_nom = Editeur.find_by_nom_editeur(search_term[:nom_editeur])
			Livre.where(['editeur_id = ?', edit_nom.id ])
		elsif search_term[:nom_genre].present?
		Livre.joins(:genres).where(['nom_genre  = ? ', "#{search_term[:nom_genre]}"]).all
		elsif search_term[:liste_alire].present?
		Livre.where(['alire = "t" ']).all
	    end
	end
end
