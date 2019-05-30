class MessagesController < ApplicationController
     before_action :authenticate_team!, :only => [:create]
     
     
    def create
        @message = Message.create(params.require(:message).permit(:team_id,:room_id,:message).merge(:team_id => current_team.id))
        redirect_to :back
    end
end
