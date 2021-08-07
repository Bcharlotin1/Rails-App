class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception #rotect themselves from Cross-Site Request Forgery (CSRF) 
    include ApplicationHelper
   
private 

    def require_login
        redirect_to root_path unless logged_in?
    end

end
