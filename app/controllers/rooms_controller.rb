class RoomsController < ApplicationController
    before_action :authenticate_team!, :only => [:index,:show,:create,:edit,:update]

    def index
        @entries = current_team.entries
    end

    def show
        if room_exist(params[:id])
            @room = Room.find(params[:id])
            @messages = @room.messages
            @message = Message.new
            @entries = @room.entries
        else
            flash[:alert] = "存在しないチャットです"
            redirect_to rooms_path
        end
        
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


 private
    def room_exist(room_id)
        if Room.find_by(id: room_id)
            return true
        else
            return false
        end
    end





end
