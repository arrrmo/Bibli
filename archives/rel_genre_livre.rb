# == Schema Information
#
# Table name: rel_genre_livres
#
#  id         :integer          not null, primary key
#  genre_id   :integer
#  livre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GenreLivre < ActiveRecord::Base

	belongs_to :genre, class_name: "Genre", foreign_key: "genre_id"
	belongs_to :livre, class_name: "Livre", foreign_key: "livre_id"
	validates :genre_id, presence: true
	validates :livre_id, presence: true
end
