class MissionsController < ApplicationController

    def new
        @mission = Mission.new
    end 

    def index 
        @missions = Missions.all
    end 

    def create
        @mission = Mission.new(m_params)
    end 

    def edit

    end 

    def update
        if @mission.update(m_params)
            redirect_to mission_path
        else
            render 'edit'
        end 
    end 

    def destroy
        Mission.find(params[:id]).destroy
        redirect_to decision_path
    end 

    private

    def m_params
        params.require(:mission).permit(:company_id, :dock_id, :ship)
    end 
end
