class TeamsController < ApplicationController
    before_action :authenticate_team!, :only => [:show,:index,:edit,:update]
    def index 
        @teams = Team.all
    end
    
    def show
        @team = Team.find(params[:id])
        if @team.id == current_team.id
           @entries = current_team.entries.limit(3)
        else
        @room = Room.new
        @entry = Entry.new
        @friend = Friend.new
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





end
