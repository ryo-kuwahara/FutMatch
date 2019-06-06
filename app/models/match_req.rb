class MatchReq < ApplicationRecord
   validate :start_end_check

  def start_end_check
    errors.add(:end_time, "の日付を正しく記入して下さい。") unless
    self.start_time < self.end_time
  end 
    
    belongs_to :relation,optional: true
    has_many :team
    has_many :challenges
  
end
