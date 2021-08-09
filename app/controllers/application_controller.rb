class ApplicationController < ActionController::Base
    include ApplicationHelper

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   
private 

    def require_login
        redirect_to root_path unless logged_in?
    end

    def record_not_found(error)
        @message = error.message
        render :"layouts/error_page"
    end
end
