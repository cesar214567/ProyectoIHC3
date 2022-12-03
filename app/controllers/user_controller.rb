class UserController < ApplicationController
    def create
        @user = User.new(user_params)
        @user.save!
        render json: @user
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
