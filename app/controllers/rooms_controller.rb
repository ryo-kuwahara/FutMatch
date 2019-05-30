class RoomsController < ApplicationController
    before_action :authenticate_team!, :only => [:index,:show,:create,:edit,:update]

    def index
        @entries = current_team.entries
    end

    def show
        @room = Room.find(params[:id])
        @messages = @room.messages
        @message = Message.new
        @entries = @room.entries
    end
    
    def create
        @room = Room.create
        @entry1 = Entry.create(:room_id => @room.id, :team_id => current_team.id)
        @entry2 = Entry.create(params.require(:entry).permit(:team_id, :room_id).merge(:room_id => @room.id))
        redirect_to "/rooms/#{@room.id}"
        flash[:notice] = "チャットを作成しました"
    end


    def edit
        @room = Room.find(params[:id])
    end


    def update
        @room = Room.find(params[:id])
        @room.update(params.require(:room).permit(:name,:explain))
        redirect_to :back
        flash[:notice] = "編集が完了しました"
    end



    end
