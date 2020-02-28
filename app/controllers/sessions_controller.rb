class SessionsController < ApplicationController
    # skip_before_filter :verify_authenticity_token, :only => :create
    skip_before_action :authorized, only: [:new, :create, :home]
    def home
    end

    def new
    end 

    def login
    end 
        
    def create
        # @person = {:name => user_info[:extra][:name], :password => user_info[:extra][:password]}
        #     render :new
        # @company = Company.find_by_name(params[:name])
        #
        # byebug
        @company = Company.find_by(name: params["/signin"][:name])  
            #  byebug
         if @company && @company.authenticate(params["/signin"][:password])
            # byebug
            session[:company_id] = @company.id
            # sessions[:company_id] = @company.id 
            redirect_to docks_path
            if user_info
                redirect_to docks_path
            end 
        
   
        #     if user_info
        #        user_info
        #        redirect_to new_dock_path
        #         # @company = Company.find_or_create_by(:name => 'user_info') do |u|
        #         #     u.name = user_info
        #         # end 
        #     end
        else 
            redirect_to signup_path
            # redirect_to root_path
        end 
            
    end 

    def page_requires_login

    end 


    def destroy
        if current_user
            session.destroy
            redirect_to root_path
        end 
        #  session.delete(:current_user_id)
        #  @_current_user = nil
        #  redirect_to root_path, notice: "Logged out!"
     end 

     private

     def user_info
        request.env['omniauth.auth']
        # request.env['omniauth.auth']['exra_info']
     end 
end


