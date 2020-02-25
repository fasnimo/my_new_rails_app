class SessionsController < ApplicationController
    # skip_before_filter :verify_authenticity_token, :only => :create
    def home
    end
        
    def create
        # @person = {:name => user_info[:extra][:name], :password => user_info[:extra][:password]}
        #     render :new
        # @company = Company.find_by_name(params[:name])
        #
        @company = Company.find_by(:id => params[:company][:id])  
         if @company && @company.authenticate(params[:name], params[:password_digest])
            session[:current_user_id] = @company.id
            # session[:company_id]=@company.id 
             
            redirect_to new_dock_path
             if user_info
                 redirect_to new_dock_path
             end 
            
   
        #     if user_info
        #        user_info
        #        redirect_to new_dock_path
        #         # @company = Company.find_or_create_by(:name => 'user_info') do |u|
        #         #     u.name = user_info
        #         # end 
        #     end
          else 
            render :new
            # redirect_to root_path
         end 
            
    end 


    def destroy
        # if current_user
        #     session.destroy
        #     redirect_to root_path
        # end 
         session.delete(:current_user_id)
         @_current_user = nil
         redirect_to root_path, notice: "Logged out!"
     end 

     private

     def user_info
        request.env['omniauth.auth']['exra_info']
     end 
end


