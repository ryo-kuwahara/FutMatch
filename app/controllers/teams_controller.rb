class TeamsController < ApplicationController
    before_action :authenticate_team!, :only => [:show,:index,:edit,:update]
    def index 
        @teams = Team.all
    end
    
    def show
        if team_exist(params[:id])
            @team = Team.find(params[:id])
            if @team.id == current_team.id
               @entries = current_team.entries.limit(3)
            else
            @room = Room.new
            @entry = Entry.new
            @friend = Friend.new
            end
        else
            flash[:alert] = "Team#{params[:id]}は存在しないTeamです"
            redirect_to teams_path
            
        end
        
    end
    
    def edit
         @team = Team.find(params[:id])
    end
    
    def update
         @team = Team.find(params[:id])
         @team.update(params.require(:team).permit(:name,:image,:rank,:cat,:age_ave,:pref,:facility,:profile))
         flash[:notice] = "情報を編集しました"
         redirect_to "/teams/#{@team.id}"
    end


 private
    def team_exist(team_id)
        if Team.find_by(id: team_id)
            return true
        else
            return false
        end
    end



end
