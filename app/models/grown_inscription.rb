class GrownInscription < ApplicationRecord
  belongs_to :grown_activity
  belongs_to :user

  validates :grown_activity_id, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :user_id, scope: [:grown_activity_id], message: "Vous êtes déjà inscrit à cette activitée"
end
