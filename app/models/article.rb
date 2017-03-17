class Article < ApplicationRecord
  belongs_to :activity

  validates :title, presence: true
  validates :content, presence: true
end
