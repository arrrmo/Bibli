# == Schema Information
#
# Table name: rel_auteur_livres
#
#  id         :integer          not null, primary key
#  auteur_id  :integer
#  livre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AuteurLivre < ActiveRecord::Base

	belongs_to :auteur , class_name: "Auteur", foreign_key: "auteur_id"
	belongs_to :livre, class_name: "Livre", foreign_key: "livre_id"
	validates :auteur_id, presence: true
	validates :livre_id, presence: true
end
