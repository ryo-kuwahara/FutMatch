class Challenge < ApplicationRecord
    belongs_to :match_req
    belongs_to :team
end
