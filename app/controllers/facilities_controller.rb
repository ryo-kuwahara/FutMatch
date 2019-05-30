class FacilitiesController < ApplicationController
    
    before_action :authenticate_team!, :only => [:index,:new,:create,:edit]
    
    def index
        @facilities = Facility.all
    end
    
    def show
        @facility = Facility.find(params[:id])
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
    
end
