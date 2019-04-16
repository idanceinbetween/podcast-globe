class Podcast < ApplicationRecord
  has_many :episodes
  has_many :categorisations
  has_many :categories, through: :categorisations
end
