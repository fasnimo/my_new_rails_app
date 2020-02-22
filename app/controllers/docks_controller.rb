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

    def edit
    end 

    def update
        if @dock.update(d_params)
            redirect_to dock_path
        else
            render 'edit'
        end 
    end 
        

    def show
        @dock = Dock.find_by(params[:id])
        # @dock = Dock.find_by(d_params)
    end 

    def destroy
        Dock.find(params[:id]).destroy
        redirect_to dock_path
    end

    private

    def d_params
        params.require(:dock).permit(:name, :location)
    end 


end
