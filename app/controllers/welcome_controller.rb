class WelcomeController < ApplicationController
    def home
        if logged_in?
            redirect_to user_path(session[:user_id])
        end
    end
end 