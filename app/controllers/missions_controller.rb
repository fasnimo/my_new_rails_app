class MissionsController < ApplicationController
    # validates :ship, presence: true
    
    def new
        @mission = Mission.new(m_params)
    end 

    def index 
        # binding.pry
        # @missions = Mission.all
        @port = Port.find_by(:id => params[:port_id])
        @missions = @port.missions
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
        
        #  @mission = Mission.new(m_params)
        # if @mission.save
        #     # session[:ship] = @mission.ship
        #     redirect_to port_mission_path
        #     # redirect_to missions_path
        # else
        #     redirect_to new_mission_path
        # end
        binding.pry
        @port = Port.find_by(:id => params[:port_id])
        @mission = @port.missions.create(m_params)
        redirect_to port_path(@port)
    end 

    def edit
        # if current_user
        #     @mission = Mission.find(params[:id])
        # end
    end 

    def update
        # byebug
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
        # params.require(:mission).permit(:ship)
        params.require(:mission).permit(:company_id, :port_id, :ship, :complete)
    end 
end