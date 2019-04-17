class User < ApplicationRecord
  has_many :notes
  has_many :annotated_episodes, through: :notes
  has_many :favouritisations
  has_many :favourite_episodes, through: :favouritisations
  has_many :subscriptions
  has_many :podcasts, through: :subscriptions

  has_secure_password

  has_many :active_relationships, class_name:  "Followship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name:  "Followship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

end
