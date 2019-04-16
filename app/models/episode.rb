class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :keywordisations
  has_many :keywords, through: :keywordisations
end
