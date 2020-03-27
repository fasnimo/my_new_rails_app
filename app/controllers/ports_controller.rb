class PortsController < ApplicationController
    before_action :require_login
    before_action :found
    
    def new
        @port = Port.new
        @port.missions.build
    end 

    def index
         @ports = Port.search(params[:term])
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
            render new_port_path
        end 
    end 

    def edit
    end 

    def update
        @port.update(p_params)
        if @port.save
            redirect_to port_path
        else
            render 'edit'
        end 
    end 
        

    def show
    end 

    def destroy
        @port.destroy
        redirect_to ports_path
    end

    private

    def p_params
         params.require(:port).permit(:title, :item, missions_attributes: [:id, :ship, :complete])
    end 

    def found
        @port = Port.find_by(:id => params[:id])
    end 
end
