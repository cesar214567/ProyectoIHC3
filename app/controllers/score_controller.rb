class ScoreController < ApplicationController
    def create
        @score = Score.new(score: params[:score])
        @player = Player.where(email: params[:email],password: params[:password]).first
        unless @player
            @player = Player.new(email: params[:email],password: params[:password])
            unless @player.save
                payload = {
                    error: "No such player; check the submitted email address",
                    status: 400
                  }
                return render json: payload,:status => 400
            end 
        end
        @score.player = @player
        @score.save!
        render json: @score.to_json(:include =>[:player => {:except => [:password ]}])
    end

    def index
        @scores = Score.includes(:player).limit(10).order("score DESC")
        render json: @scores.to_json(:include =>[:player => {:except => [:password ]}])
    end
end
