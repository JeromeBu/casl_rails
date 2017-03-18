class Inscription < ApplicationRecord
  belongs_to :child
  belongs_to :activity

  validates :activity_id, presence: true
  validates :child_id, presence: {:message => "Veuillez selectionner un enfant"}
  validates_uniqueness_of :child_id, scope: [:activity_id], message: "Cet enfant est déjà inscrit à cette activitée"
end
