class Child < ApplicationRecord
  belongs_to :user
  has_many :inscriptions, dependent: :destroy
  has_many :activities, through: :inscriptions

  validates :first_name, presence: {:message => "Veuillez remplir le prénom de l'enfant"}
  validates_uniqueness_of :first_name, scope: [:user_id], message: "Vous avez déjà un enfant avec ce prénom"
  validates :last_name, presence: {:message => "Veuillez remplir le nom de l'enfant"}
  validates :sex, presence: {:message => "Veuillez remplir le sexe de l'enfant"}
  validates :sex, inclusion: { in: ["Garçon", "Fille"] }
  validates :birth_date, presence: {:message => "Veuillez remplir la date de naissance"}
  validates :school, presence: {:message => "Veuillez remplir l'école de l'enfant"}
end
