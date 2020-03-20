class MissionsController < ApplicationController
    before_action :authorized_editor, only: [:edit]
    def new
        @mission = Mission.new(m_params)
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
        # binding.pry
        @mission = Mission.find(params[:id]) 
    end 

    def update
        @mission = Mission.find(params[:id])
         @mission.update(m_params)
        if @mission.save
            redirect_to port_mission_path(@mission.port)
        else
            render 'edit'
        end 
    end 

    def show
        @mission = Mission.find(params[:id])
    end

    def destroy
       @mission = Mission.find(params[:id])
       @mission.destroy
        redirect_to ports_path
    end 

    private

    def m_params
        params.require(:mission).permit(:company_id, :port_id, :ship, :complete)
    end 
end