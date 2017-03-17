class Activity < ApplicationRecord
  has_many :inscriptions
  has_many :articles

  validates :title, presence: true
  validates :max_participants, presence: true
end
