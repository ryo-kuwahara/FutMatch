class FriendsController < ApplicationController
    
    before_action :authenticate_team!
    

      
  def index
    
    @friends = []
    @request_friends = []
    @receive_friends = []
    
    Friend.where(follower_id: current_team.id).each do |f|
      if Friend.find_by('follower_id = ? and followed_id = ?', f.followed_id, current_team.id) 
      logger.debug("--------------------- 友達　f.followed_id = #{f.followed_id}")
        @friends.push(f.followed_id)
        
      else
      logger.debug("--------------------- 申請中f.followed_id = #{f.followed_id}")
       
        @request_friends.push(f.followed_id)

      end
    end
    
    Friend.where(followed_id: current_team.id).each do |f|
      if !Friend.find_by('follower_id = ? and followed_id = ?', current_team.id, f.follower_id) 
      logger.debug("--------------------- 承認待ち　f.followed_id = #{f.follower_id}")
        	@receive_friends.push(f.follower_id)
      end
    end
         
  end
  
  
  def create
      # if !Friend.find_by(follower: @current_user.id, followed: params[@user.id])
        @friend = Friend.new(
            follower_id: current_team.id,
            followed_id: params[:friend][:followed_id])
        @friend.save
        logger.debug("--------------------- 申請　f.follower_id = #{@friend.follower_id}")
        logger.debug("--------------------- 申請　f.followed_id = #{ params[:friend][:followed_id]}")
        flash[:nitice] = "申請しました"
        redirect_to("/friends")
      # end    
  end
     
    def destroy
      
    end
    
end


