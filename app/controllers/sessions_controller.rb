class SessionsController < ApplicationController
    def home

    end
    
    def create
    
    user_info = request.env['omniauth.auth']
    redirect_to new_dock_path
    # render '/sessions/new'
    end 
end
