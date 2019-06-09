module ChallengesHelper
     def challenge_exist(match_req_id)
        match_req = MatchReq.find(match_req_id.to_i)
        team = match_req.team_id
            if Challenge.where(match_req_id: team, team_id: current_team.id ).present?
                 return true
             else
                return false
            end
     end
    
end
