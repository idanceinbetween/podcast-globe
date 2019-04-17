class Category < ApplicationRecord
  has_many :categorisations
  has_many :podcasts, through: :categorisations

  def options_display
    "#{self.name} (#{self.podcasts.count})"
  end

end
