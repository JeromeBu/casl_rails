class Activity < ApplicationRecord
  has_many :inscriptions, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_attachment :photo

  validates :title, presence: true
  validates :max_participants, presence: true
end
