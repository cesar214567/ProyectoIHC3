class ScoreController < ApplicationController
    def create
        @score = Score.new(score: params[:score])
        @user = User.where(email: params[:email],password: params[:password]).first
        unless @user
            @user = User.new(email: params[:email],password: params[:password])
            unless @user.save
                payload = {
                    error: "No such user; check the submitted email address",
                    status: 400
                  }
                return render json: payload,:status => 400
            end 
        end
        @score.user = @user
        @score.save!
        render json: @score.to_json(:include =>[:user => {:except => [:password ]}])
    end

    def index
        @scores = Score.includes(:user).limit(10).order("score DESC")
        render json: @scores.to_json(:include =>[:user => {:except => [:password ]}])
    end
end
