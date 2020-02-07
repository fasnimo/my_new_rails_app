class CompaniesController < ApplicationController

    def new
    end 

    def create
        @company=Company.new(c_params)
        if @company.save
            session[:company_id] = @company.id
            # redirect_to new_dock_path
        else
            # redirect_to root_path
        end
    end 

    def show
        @company = Company.find(params[:id])
    end 

    private 
    def c_params
        params.require(:company).permit(:name, :ship_name, :password_digest)
    end
end
