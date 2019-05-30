class Friend < ApplicationRecord
    validates :followed_id, :follower_id, presence: true
    belongs_to :follower, class_name: "Team"
    belongs_to :following, class_name: "Team"
end
