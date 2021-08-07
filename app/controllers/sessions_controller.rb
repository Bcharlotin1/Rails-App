class SessionsController < ApplicationController
 
    def new
      if logged_in?
        redirect_to user_path(session[:user_id])
      end
    end 

    def create
        if !params[:password].blank? || !params[:user].blank?

          @user = User.find_by(email: params[:email])

            if !@user.blank?
              return head(:forbidden) unless @user.authenticate(params[:password])
              session[:user_id] = @user.id
              redirect_to user_path(@user)
            else
              flash[:message] = "Wrong Email or Password"  
              render :new
            end 

        else
          flash[:message] = "Can't leave the fields blank"  
          render :new
        end
    end

    def omniauth
     
      user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
        u.email = auth[:info][:email]
        u.username = auth[:info][:name]
        u.password = SecureRandom.hex(12)
      
       end

       if user.valid?
          session[:user_id] = user.id
          flash[:alert] = "Successful Login" 
          redirect_to user_path(user)
       else
          flash[:alert] = "Signin or Create account was unsucessful" 
          redirect_to root_path
       end

    end

      
    def destroy
      session.clear
        redirect_to root_path 
    end

    private 

    def auth
      request.env['omniauth.auth']
    end

end