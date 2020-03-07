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
        # byebug
        @mission = Mission.new(m_params)
        #  byebug
        if @mission.save
            session[:port_id] = @port_id.id
             redirect_to ports_path
            # redirect_to missions_path
            # redirect_to company_path
        else
            redirect_to new_mission_path
        end 
    end 

    def edit
        @mission = Mission.find(params[:id])
    end 

    def update
        # byebug
        @mission = Mission.find(params[:id])
        if @mission.update(m_params)
            redirect_to mission_path
        else
            render 'edit'
        end 
    end 

    def show
        @mission = Mission.find(params[:id])
    end

    def destroy
        Mission.find(params[:id]).destroy
        redirect_to mission_path
    end 

    private

    def m_params
        # params.require(:mission).permit(:ship)
        params.require(:mission).permit(:company_id, :port_id, :ship)
    end 
end