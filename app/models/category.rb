class Category < ApplicationRecord
  has_many :categorisations
  has_many :podcasts, through: :categorisations
end
