class UsersController < ApplicationController
    before_action :require_logged_in, only: [:index, :show, :edit, :update, :destroy]
    
    def new
        @user = User.new
        render :new
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end
end