class PortsController < ApplicationController

    def new
        @port = Port.new
        @port.mission.build(ship: 'Shipment Sent')
    end 

    def index
        @ports = Port.all
    end 

    def create
        @port = Port.new(p_params)
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
        params.require(:port).permit(:title, :item)
    end 


end
