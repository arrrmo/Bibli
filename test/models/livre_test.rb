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

require 'test_helper'

class LivreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
