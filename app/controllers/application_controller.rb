class ApplicationController < ActionController::Base
    helper_method :current_user

  def current_user
    @company ||= Company.find_by_id(session[:company_id]) 
  end 

#   def require_login
#     if !current_company
#       redirect_to root_url
#     end 
#   end 
end
