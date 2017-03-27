class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :children, dependent: :destroy

  validates :civility, presence: {:message => "Veuillez remplir ce champ"}
  validates :civility, inclusion: { in: ["M.", "Mme" , "Mlle"] }
  validates :first_name, presence: {:message => "Veuillez remplir ce champ"}
  validates :last_name, presence: {:message => "Veuillez remplir ce champ"}
  validates :address, presence: {:message => "Veuillez remplir ce champ"}
  validates :main_phone, presence: {:message => "Veuillez remplir ce champ"}
  validates :main_phone, format: {:with => /\A(\+\d{2}\s?|0)\d\s?(\d\s?){8}\Z/, :message => "Veuillez renseigner un téléphone français" }
end
