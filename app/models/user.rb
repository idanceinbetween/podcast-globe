class User < ApplicationRecord
  has_many :notes
  has_many :annotated_episodes, through: :notes
  has_many :favouritisations
  has_many :favourite_episodes, through: :favouritisations
  has_many :subscriptions
  has_many :podcasts, through: :subscriptions

  has_secure_password
  #
  # has_many :followships
  #
  # has_many :active_followships, class_name: "Followship", foreign_key: "follower_id"
  # has_many :followees, through: :active_followships, source: :followee
  #
  # has_many :passive_followships, class_name: "Followship", foreign_key: "followee_id"
  # has_many :followers, through: :passive_followships, source: :follower

  def toggle_subscription(podcast)
    !self.podcasts.include?(podcast) ? self.podcasts.push(podcast) : self.podcasts.delete(podcast)
  end

end
