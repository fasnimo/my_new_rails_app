class SessionsController < ApplicationController
    # skip_before_filter :verify_authenticity_token, :only => :create
    def home
    end
        
    def create
           @company = Company.find_by(:name => params[:name])
             byebug
        if @company && @company.authenticate(params[:password])
             byebug
            session[:company_id]=@company.id 
            # byebug
            redirect_to new_dock_path
            # byebug
   
        #     if user_info
        #        user_info
        #        redirect_to new_dock_path
        #         # @company = Company.find_or_create_by(:name => 'user_info') do |u|
        #         #     u.name = user_info
        #         # end 
        #     end
        # else 
        #     render :new
            # redirect_to root_path
        end 
            # render '/sessions/new'
    end 


    def destroy
        if current_user
            session.destroy
            redirect_to root_path
        end 
     end 

     private

     def user_info
        request.env['omniauth.auth']
     end 
end

# request.env['omniauth.auth']['info']['nickname']
