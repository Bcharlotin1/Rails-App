class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    
    def new
        if logged_in?
            redirect_to user_path(session[:user_id])
        else
            @user = User.new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
      
        if @user
            #must chec if user exsits firs befoe  seconf if stsement
            #find_by returns nil if the user does not exsits and you can calle @user.id on nil
            if @user.id != session[:user_id]
                return head(:forbidden) 
            end 
        else  
            return head(:forbidden) 
        end
    end

    def edit
            @user = User.find_by_id(params[:id])
            if @user
                #must check if user exsits firs befoe  seconf if stsement
                #find_by returns nil if the user does not exsits and you can calle @user.id on nil
                if @user.id != session[:user_id]
                    return head(:forbidden) 
                end 
            else  
                return head(:forbidden) 
            end
    end

    def create
        @user = User.new(user_params)
            if  @user.save
                @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                render :new
            end
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.valid?
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit 
        end
    end

    def destroy
        @user = User.find_by_id(params[:id])
        session.delete(:user_id)
        User.delete(@user.id) 
        redirect_to root_path
      end


    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :age, :about)
    end
end
