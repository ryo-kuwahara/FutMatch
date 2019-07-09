module TeamsHelper
    def application
        team = Team.find(team_id.to_i)
    end
    
    def exist_team(team,room)
        if Entry.find_by(team: team_id,room: room_id)
            return true
        else
            return false
        end
    end
    
end
