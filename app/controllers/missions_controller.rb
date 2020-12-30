class MissionsController < ApplicationController
    before_action :authorized_editor, only: [:edit]
    before_action :misson
    def new
        @mission = Mission.new
    end 

    def index 
        @port = Port.find_by(:id => params[:port_id])
        @missions = @port.missions
    end 

    def create
        @port = Port.find_by(:id => params[:port_id])
        @mission = @port.missions.create(m_params)
        redirect_to port_path(@port)
    end 

    def edit  
    end 

    def update
         @mission.update(m_params)
        if @mission.save
            redirect_to port_mission_path(@mission.port)
        else
            render 'edit'
        end 
    end 

    def show
    end

    def destroy
       @mission.destroy
        redirect_to ports_path
    end 

    private

    def m_params
        params.require(:mission).permit(:company_id, :port_id, :ship, :complete)
    end
    
    def misson
        @mission = Mission.find_by(:id => params[:id])
    end 
end