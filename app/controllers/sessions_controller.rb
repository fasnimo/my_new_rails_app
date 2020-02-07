class SessionsController < ApplicationController
    def home

    end
    
    def create
    
    user_info = request.env['omniauth.auth']
    render '/sessions/new'
    end 
end
