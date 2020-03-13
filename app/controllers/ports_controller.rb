class PortsController < ApplicationController
     before_action :logged_in?
    def new
        @port = Port.new
         2.times { @port.missions.build }
        # @mission = Port.mission.build(params[:company_id, :port_id, :ship])
    end 

    def index
        @ports = Port.all
        # @mission = Mission.find_by(:id => params[:id])
        # @mission.complete
    end 

    def create
        @port = Port.new(p_params)
        # @port.missions.build(p_params[:missions_attributes]['0'])
        # @port.missions.build(p_params[:missions_attributes]['1'])
        # binding.pry
        if @port.save
            @port.missions.each do |mission|
                mission.company_id = session[:company_id]
                mission.save
            end 
            # session[:port_id] = @port.id
            # session[:title] = @port.title
            #  redirect_to port_mission_path(@port)
            # binding.pry

              redirect_to port_path(@port)
        else 
            redirect_to new_port_path
        end 
    end 

    def edit
        @port = Port.find(params[:id])
       
    end 

    def update
        @port = Port.find(params[:id])
        if @port.update(p_params)
            redirect_to port_path
        else
            render 'edit'
        end 
    end 
        

    def show
        @port = Port.find(params[:id])
        # @dock = Dock.find_by(d_params)
    end 

    def destroy
        Port.find(params[:id]).destroy
        redirect_to ports_path
    end

    private

    def p_params
         params.require(:port).permit(:title, :item, missions_attributes: [:id, :ship, :complete])
        # params.require(:port).permit(:title, :item, missions_attributes: [:id, :company_id, :port_id, :ship], companies: [:id, :name])
    end 


end
