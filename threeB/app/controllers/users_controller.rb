class UsersController < ApplicationController
    require 'openssl'
    require 'base64'
    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        @user.password = params[:password]
        @user.avatar.attach(params[:avatar])
        
        session[:user_id] = @user.id
        if (@user.save!)
            redirect_to '/welcome'
        else
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.avatar.attach(params[:avatar])
        
        if(@user.update(user_params))
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        
        redirect_to user_path
    end
    
    private 
    
    def user_params
        params.require(:user).permit(:fName, :lName, :email, :user_type, :avatar)
    end

end
