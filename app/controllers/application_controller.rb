class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    # helper_method :check_ownership

  def current_user
    @company ||= Company.find_by_id(session[:company_id])
    # if session[:current_user_id]
    #   @current_user = Company.find(session[:current_user_id])
    # end 
  end

  def logged_in?
    !!current_user
    # !current_user.nil?
  end 

  def authorized 
    redirect_to root_path unless logged_in?
  end
  


  # def check_ownership(company=nil, object) 
  #   company.id == object.company_id if company  
  # end 

   #def after_sign_in_path_for(resource)
    #     stored_location_for(resource) || session_path
    #   end
  
    #   def require_login
    #     if !current_company
    #       redirect_to root_url
    #     end 
    #   end 

end
