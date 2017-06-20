class GrownActivity < ApplicationRecord
  has_many :grown_inscriptions, dependent: :destroy
  has_many :grown_activity_articles, dependent: :destroy
  has_many :users, through: :grown_inscriptions

  has_attachment :photo

  validates :title, presence: true
  validates :max_participants, presence: true
end
