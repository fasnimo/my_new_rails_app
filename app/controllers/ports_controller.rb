class PortsController < ApplicationController

    def new
        @port = Port.new
         1.times { @port.missions.build }
        # @mission = Port.mission.build(params[:company_id, :port_id, :ship])
    end 

    def index
        @ports = Port.all
    end 

    def create
        @port = Port.create(p_params)
        if @port.save
            session[:port_id] = @port.id
            session[:title] = @port.title
            # @mission = Mission.create
            redirect_to ports_path
        else 
            redirect_to new_port_path
        end 
    end 

    def edit
    end 

    def update
        if @port.update(p_params)
            redirect_to port_path
        else
            render 'edit'
        end 
    end 
        

    def show
        @port = Port.find_by(params[:id])
        # @dock = Dock.find_by(d_params)
    end 

    def destroy
        Port.find(params[:id]).destroy
        redirect_to port_path
    end

    private

    def p_params
        # params.require(:port).permit(:title, :item, missions: [:id, :company_id, :port_id, :ship])
        params.require(:port).permit(:title, :item, missions: [:id, :ship])
    end 


end
