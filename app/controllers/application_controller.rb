class ApplicationController < ActionController::Base
  before_action :require_login, only: [:edit, :update, :destroy] 
  before_action :authorized, only: [:edit]
  helper_method :current_user, :logged_in?
  
  def current_user
    @company ||= Company.find_by_id(session[:company_id])
  end

  def logged_in?
    !current_user.nil?
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

  def authorized_editor 
    unless logged_in? && current_user == Mission.find(params[:id]).company
       flash[:error] = "You are not authorized to edit this mission!"
       redirect_to ports_path
    end
  end
end
