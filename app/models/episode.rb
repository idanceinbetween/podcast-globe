class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :keywordisations
  has_many :keywords, through: :keywordisations
  has_many :notes
  has_many :users, through: :notes
  has_many :favouritisations
  has_many :favouritees, through: :favouritisations, source: :favouriter
end
