class Favouritisation < ApplicationRecord
  belongs_to :fafe, class_name: "Episode", foreign_key: "episode_id"
  belongs_to :user
end
