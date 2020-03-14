class MissionsController < ApplicationController
    
    def new
        @mission = Mission.new(m_params)
    end 

    def index 
        @port = Port.find_by(:id => params[:port_id])
        @missions = @port.missions
    end 

    def create
         # binding.pry
        @port = Port.find_by(:id => params[:port_id])
        @mission = @port.missions.create(m_params)
        redirect_to port_path(@port)
    end 

    def edit     
    end 

    def update
        @mission = Mission.find(params[:id])
        if @mission.update(m_params)
            redirect_to port_path(@port)
        else
            render 'edit'
        end 
    end 

    def show
        @mission = Mission.find(params[:id])
    end

    def destroy
       @mission = Mission.find(params[:id]).destroy
        redirect_to missions_path
    end 

    private

    def m_params
        params.require(:mission).permit(:company_id, :port_id, :ship, :complete)
    end 
end