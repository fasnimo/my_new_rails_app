class ApplicationController < ActionController::Base
  #  before_action :require_login
  before_action :require_login, only: [:index, :edit, :update, :destroy]
  # before_action :authorized
  before_action :authorized, only: [:edit]
  helper_method :current_user, :logged_in?
  
  def current_user
    @company ||= Company.find_by_id(session[:company_id])
  end

  # def logged_in?
  #   current_user != nil
  # end 

  def logged_in?
    !current_user.nil?
  end 
  # def authorized 
  #   redirect_to root_path unless logged_in?
  # end

  def authorized(company = nil)
    if company.nil?
      not_authorized("Login to view this page!") unless logged_in?
    else
      not_authorized("Login to view this page!") unless current_user
    end 
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end 
  end 
# new
  def not_authorized(msg)
    redirect_to root_path, notice: msg and return
  end 

end
