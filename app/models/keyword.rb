class Keyword < ApplicationRecord
  has_many :keywordisations
  has_many :episodes, through: :keywordisations
end
