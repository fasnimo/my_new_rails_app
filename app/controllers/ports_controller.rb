class PortsController < ApplicationController
    before_action :require_login
    before_action :found
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
              @port[:errors]
              redirect_to port_path(@port)
        else 
            render new_port_path
        end 
    end 

    def edit
        # @port = Port.find(params[:id])
        if current_user.nil?
            redirect_to port_missions_path
        end
       
    end 

    def update
        # @port = Port.find(params[:id])
        @port.update(p_params)
        if @port.save
            redirect_to port_path
        else
            render 'edit'
        end 
    end 
        

    def show
        # @port = Port.find(params[:id])
    end 

    def destroy
        # @port = Port.find(params[:id])
        @port.destroy
        redirect_to ports_path
    end

    private

    def p_params
         params.require(:port).permit(:title, :item, missions_attributes: [:id, :ship, :complete])
    end 

    def found
        # or @port.find(params[:id])
        @port = Port.find_by(:id => params[:id])
    end 
end
