class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :keywordisations
  has_many :keywords, through: :keywordisations
  has_many :notes
  has_many :notators, through: :notes
  has_many :favouritisations
  has_many :favouriters, through: :favouritisations
end
