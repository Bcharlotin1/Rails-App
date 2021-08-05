class UsersController < ApplicationController
    before_action :set_user_variable, except:[:new, :create]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    

    def show
        if @user
            if @user.id != session[:user_id]
                return head(:forbidden) 
            end 
        else  
            return head(:forbidden) 
        end
    end

    def new
        if logged_in?
            redirect_to user_path(session[:user_id])
        else
            @user = User.new
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

    def edit
            if @user
                if @user.id != session[:user_id]
                    return head(:forbidden) 
                end 
            else  
                return head(:forbidden) 
            end
    end

    def update
        if @user.valid?
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit 
        end
    end

    def destroy
        session.delete(:user_id)
        @user.destroy
        redirect_to root_path
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :age, :about)
    end

    def set_user_variable
        @user = User.find_by_id(params[:id])
    end
end
