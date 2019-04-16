class Note < ApplicationRecord
  belongs_to :user
  belongs_to :annotated_episode, class_name: "Episode", foreign_key: "episode_id"
end
