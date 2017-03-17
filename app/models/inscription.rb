class Inscription < ApplicationRecord
  belongs_to :child
  belongs_to :activity

  validates :child_id, uniqueness: { scope: :activity_id }
end
