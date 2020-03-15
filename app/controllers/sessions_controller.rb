class SessionsController < ApplicationController
     skip_before_action :authorized, only: [:new, :create, :home]
     skip_before_action :require_login, only: [:new, :create]
    
    def home
    end

    def new
    end 

    def login
    end 
        
    def create   
        if user_info = request.env['omniauth.auth']
            @company = Company.find_or_create_by_omniauth(user_info)
            session[:company_id] = @company.id
            redirect_to ports_path
        else 
            @company = Company.find_by(name: params["/signin"][:name])     
            if @company && @company.authenticate(params["/signin"][:password])  
                session[:company_id] = @company.id
                redirect_to ports_path  
            else 
                redirect_to signup_path
            end
        end  
    end 

    def page_requires_login

    end 


    def destroy
        if current_user
            session.destroy
            flash[:notice] = "You have successfully logged out"
            redirect_to root_path
        end 
     end 

     private

     def user_info
        request.env['omniauth.auth']['provider']['info']
     end

end







