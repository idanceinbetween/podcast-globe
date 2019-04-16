class Favouritisation < ApplicationRecord
  belongs_to :fave, class_name: "Episode", foreign_key: "episode_id"
  belongs_to :user
end
