class RelationsController < ApplicationController
     before_action :authenticate_team!, :only => [:create]

    def create
                Relation.create(params.require(:relation).permit(:receive_team_id,:request_team_id,:comment).merge(:request_team_id => current_team.id))
                flash[:notice] = "応募しました"
                redirect_to :back
    end
end
