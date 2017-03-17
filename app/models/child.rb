class Child < ApplicationRecord
  belongs_to :user
  has_many :inscriptions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :birth_date, presence: true
  validates :school, presence: true
end
