class ChallengesController < ApplicationController
    
    
    def new
        @challenge = Challenge.new
    end
     
    def create
         @challenge = Challenge.create(params.require(:challenge).permit(:match_req_id,:team_id).merge(:team_id => current_team.id))
         flash[:notice] = "応募が完了しました"
         redirect_back(fallback_location: root_path)
        
    end
     
    def destroy
    end
    
end
