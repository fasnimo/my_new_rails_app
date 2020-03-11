class ApplicationController < ActionController::Base
  # before_action :require_login
  before_action :authorized
  helper_method :current_user, :logged_in?
    # helper_method :logged_in?
    
    
   

  def current_user
    @company ||= Company.find_by_id(session[:company_id])
    # if session[:current_user_id]
    #   @current_user = Company.find(session[:current_user_id])
    # end 
  end

  def logged_in?
    current_user != nil
    # !current_user.nil?
  end 

  def authorized 
    redirect_to root_path unless logged_in?
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end 
  end 


    # def require_login
    #   if !current_user
    #     redirect_to root_url   
    #   end 
    
    # end 

end
