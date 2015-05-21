# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  nom_genre  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ActiveRecord::Base

	has_and_belongs_to_many :livres
	
	validates :nom_genre, presence: true#, uniqueness: { case_sensitive: false }
	
	def self.search_genre search_term
		return Genre.all unless search_term.present? 
		Genre.where(['nom_genre LIKE ?', "%#{search_term[:nom_genre]}%"]).all
	end
	
end
 
