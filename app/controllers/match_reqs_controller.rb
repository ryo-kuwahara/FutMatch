class MatchReqsController < ApplicationController
    
    def index
        @match_reqs = MatchReq.all
    end
    
    def show
        if match_req_exist(params[:id])
            @match_req = MatchReq.find(params[:id])
            @challenge = Challenge.new
        else
            flash[:alert] = "存在しない対戦募集です"
            redirect_to match_reqs_path
             
        end
    end
    
    def new
        @match_req = MatchReq.new
        
    end
    def create
          @match_req = MatchReq.create(params.require(:match_req).permit(:content,:title,:team_id,:match_date,:start_time,:end_time,:facility,:req_team_num).merge(:team_id => current_team.id))
          if @match_req.save 
              flash[:notice] = "対戦が作成されました"
              redirect_to match_reqs_path
          else
               flash[:alert] = "対戦作成されませんでした"
               render "match_reqs/new"
          end
    end
          def edit
              @match_req = MatchReq.find(params[:id])
          end
          
          def update
            
               @match_req = MatchReq.find_by(id: params[:id])
               if @match_req 
                    @match_req.update((params.require(:match_req).permit(:content,:title,:team_id,:match_date,:start_time,:end_time,:facility,:req_team_num).merge(:team_id => current_team.id)))
                    @match_req.save
                    redirect_to :back
                    flash[:notice] = "編集が完了しました"
                else
                     flash[:alert] = "編集できませんでした"
                     render "welcome/index"
               end
          end
               
          def destroy
              logger.debug("================== destroy")
               @match_req = MatchReq.find_by(id: params[:id])
               if @match_req
                    if @match_req.team_id == current_team.id
                        @match_req.destroy
                        redirect_to "/match_reqs"
                        flash[:notice] = "募集を削除しました"
                    else
                    end
               else
                    flash[:alert] = "募集削除出来ませんでした"
                    render "welcome/index"
               end
          end
    
    
    private
    def match_req_exist(match_req_id)
        if MatchReq.find_by(id: match_req_id)
            return true
        else
            return false
        end
    end
        
        
        
        
end
