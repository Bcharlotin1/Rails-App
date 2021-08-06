class SessionsController < ApplicationController
 
    
    def new
      if logged_in?
        redirect_to user_path(session[:user_id])
      end
    end 

    def create
      #issue her with corrent user name but worng password,  goed to "access to localhost was denied? is that what the forbiddin does?"
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
        #this bloock only gets activated by create
        u.email = auth[:info][:email]
        u.username = auth[:info][:name]
        u.password = SecureRandom.hex(12)
        #we are not setting up a real password,  googl takes care of the stuff,  but we need somtething
        #stored inside for validation within the app
        #we use secure randum hex,  its going to make a random number/letter/symbols for us   so that its asscoisted with the accoutn
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
      #how we acces the infromation from gogole that is being set to us ,  this equates to params
    end

end