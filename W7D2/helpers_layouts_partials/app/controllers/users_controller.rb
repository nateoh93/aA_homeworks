class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            msg = UserMailer.welcome_email(user)
            msg.deliver_now
            redirect_to cats_url
        end
    end

    def new
        @user = User.new
        render :new
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
