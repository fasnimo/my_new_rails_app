class CompaniesController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    # before_action :authenticate_company!, only: [:new, :create, :show]
    def new
        @company = Company.new
        # if  session[:current_user]
        #     redirect_to root_path, notice: "Already logged in!"
        # end 
    end 

    def index
        @companies = Company.all
    end 

    def create
        @company = Company.create(c_params)
        # byebug mayby.Company.create
        if @company.save
            session[:company_id] = @company.id
            session[:name] = @company.name
            redirect_to new_port_mission_path
            # redirect_to new_dock_path
        else
            redirect_to root_path
        end
    end 

    def show
        @company = Company.find(params[:id])
    end 

    private 
    def c_params
        params.require(:company).permit(:name, :password)
    end
end
