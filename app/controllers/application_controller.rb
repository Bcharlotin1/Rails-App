class ApplicationController < ActionController::Base
    include ApplicationHelper
   
private 

    def require_login
        redirect_to root_path unless logged_in?
    end

end
