class CompaniesController < ApplicationController
     skip_before_action :authorized, only: [:new, :create]
     
    def new
        flash.keep(:notice)
        @company = Company.new 
    end 

    def index
        @companies = Company.all
    end 

    def create
        @company = Company.new(c_params)
        if @company.save
            session[:company_id] = @company.id
            session[:name] = @company.name
            redirect_to new_port_path
        else
            render new_company_path
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
