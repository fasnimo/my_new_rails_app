class PortsController < ApplicationController
    #  before_action :logged_in?
    before_action :require_login, only: [:edit, :update, :destroy]
    def new
        @port = Port.new
         1.times { @port.missions.build }
    end 

    def index
        @ports = Port.all
    end 

    def create
        @port = Port.new(p_params)
        if @port.save
            @port.missions.each do |mission|
                mission.company_id = session[:company_id]
                mission.save
            end 
              redirect_to port_path(@port)
        else 
            redirect_to new_port_path
        end 
    end 

    def edit
        @port = Port.find(params[:id])
        if current_user.nil?
            redirect_to '/ports/:port_id/missions'
        end
       
    end 

    def update
        @port = Port.find(params[:id])
        @port.update(p_params)
        if @port.save
        # if @port.update(p_params)
            redirect_to port_path
        else
            render 'edit'
        end 
    end 
        

    def show
        @port = Port.find(params[:id])
    end 

    def destroy
        Port.find(params[:id]).destroy
        redirect_to ports_path
    end

    private

    def p_params
         params.require(:port).permit(:title, :item, missions_attributes: [:id, :ship, :complete])
    end 


end
