class FacilitiesController < ApplicationController
    
    before_action :authenticate_team!, :only => [:index,:new,:create,:edit]
    
    def index
        @facilities = Facility.all
    end
    
    def show
        if facility_exist(params[:id])
            @facility = Facility.find(params[:id])
        else
            flash[:alert] = "存在しない施設情報です"
            redirect_to facilities_path
        end
    end
    
    def new
        @facility = Facility.new
    end
     
    def create
         @facility = Facility.create(params.require(:facility).permit(:name,:tel,:image,:address))
         redirect_to "/facilities"
         flash[:notice] = "登録しました"
    end 
    
    
    def edit
        @facility = Facility.find(params[:id])
    end
    
    def update
        @facility = Facility.find(params[:id])
        @facility.update(params.require(:facility).permit(:name,:tel,:address,:image))
        redirect_to "/facilities/#{@facility.id}/edit"
        flash[:notice] = "編集しました"
    end
    
    def destroy
        @facility = Facility.find(params[:id]).destroy
         redirect_to "/facilities"
        flash[:notice] = "削除しました"
    end
    
    
    
    private
    def facility_exist(facility_id)
        if Facility.find_by(id: facility_id)
            return true
        else
            return false
        end
    end
    
    
    
end
