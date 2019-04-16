class User < ApplicationRecord
  has_many :notes
  has_many :favouritisations
  has_many :faves, through: :favouritisations
  has_many :annotated_episodes, through: :notes

  has_many :followships

  has_many :active_followships, class_name: "Followship", foreign_key: "user_id"
  has_many :followees, through: :active_followships, source: :followee

  has_many :passive_followships, class_name: "Followship", foreign_key: "followee_id"
  has_many :followers, through: :passive_followships, source: :follower


end
