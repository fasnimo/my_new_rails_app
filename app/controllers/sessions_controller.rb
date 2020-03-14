class SessionsController < ApplicationController
     skip_before_action :authorized, only: [:new, :create, :home]
    #  skip_before_action :require_login, only: [:new, :create]
    
    def home
    end

    def new
    end 

    def login
    end 
        
    def create   
        if user_info = request.env['omniauth.auth']
            oauth_name = request.env['omniauth.auth']['info']['nickname']
            if @company = Company.find_by(:name => oauth_name)
                session[:company_id] = @company.id
                redirect_to ports_path
            else
                @company = Company.create(:name => oauth_name)
                oauth_name
                session[:company_id] = @company.id
                # binding.pry
                redirect_to ports_path
            end
        else 
        @company = Company.find_by(name: params["/signin"][:name])     
         if @company && @company.authenticate(params["/signin"][:password])  
            session[:company_id] = @company.id
            # session[:port_id] = @port.id
            redirect_to ports_path
            # redirect_to missions_path

            # if user_info
            #     @company = Company.find_or_create_by(uid: user_info['uid']) do |u|
            #         u.name = user_info['info']['name']
            #         u.password = user_info['info']['password']
            #     end
            #     redirect_to docks_path
            # end 
        else 
            redirect_to signup_path
            # redirect_to root_path
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
        #  session.delete(:current_user_id)
        #  @_current_user = nil
        #  redirect_to root_path, notice: "Logged out!"
     end 

    # def oauth_login
    #     raise "stop".inspect
    #     # binding.pry
    #     @company = Company.from_omniauth(user_info)
    #     # binding.pry
    #     if user_info
    #         @company = Company.find_or_create_by(uid: user_info['uid']) do |u|
    #             u.name = user_info['info']['name']
    #             u.password = user_info['info']['password']
    #         end
    #         redirect_to ports_path
    #     else
    #         redirect_to root_path
    #     end 
    # end 

     private

     def user_info
        request.env['omniauth.auth']['provider']['info']
        # request.env['omniauth.auth']['exra_info']
     end

end







