class Child < ApplicationRecord
  belongs_to :user
  has_many :inscriptions

  validates :first_name, presence: {:message => "Veuillez remplir ce champ"}
  validates :last_name, presence: {:message => "Veuillez remplir ce champ"}
  validates :sex, presence: {:message => "Veuillez remplir ce champ"}
  validates :sex, inclusion: { in: ["Garçon", "Fille"] }
  validates :birth_date, presence: {:message => "Veuillez remplir ce champ"}
  validates :school, presence: {:message => "Veuillez remplir ce champ"}
end
