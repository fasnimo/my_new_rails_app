class MissionsController < ApplicationController

    def new
        @mission = Mission.new
    end 

    def index 
        @missions = Mission.all
    end 

    def create
        # @company = Company.find_by(id: params[:id])
        # redirect_to missions_path
        # byebug
        #  @mission = current_user.mission.build(params[:mission][:company_id][:dock_id])
        #  byebug
        #  @mission.company_id = @company
        # if @company.save
        #     redirect_to company_path
        # else 
        #     redirect_to new_mission_path
        # end 

        @mission = Mission.new(m_params)
        # byebug
        if @mission.save 
            redirect_to missions_path
            # redirect_to company_path
        else
            redirect_to missions_path
        end 
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

    def show
        @mission = Mission.find_by(m_params)
    end

    def destroy
        Mission.find(params[:id]).destroy
        redirect_to mission_path
    end 

    private

    def m_params
        params.require(:mission).permit(:company_id, :dock_id, :ship)
    end 
end
