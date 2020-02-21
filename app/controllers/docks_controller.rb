class DocksController < ApplicationController

    def new
        @dock=Dock.new
    end 

    def index
        @docks = Dock.all
    end 

    def create
        @dock = Dock.new(d_params)
        if @dock.save
            # @mission = Mission.create
            redirect_to docks_path
        else 
            redirect_to new_dock_path
        end 
    end 
        

    def show
        @dock = Dock.find_by(d_params)
    end 

    private

    def d_params
        params.require(:dock).permit(:name, :location)
    end 


end
