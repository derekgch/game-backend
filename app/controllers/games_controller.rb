class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games     
    end

    def create
        # byebug
        game = Game.create(points: params[:points])

        if(params[:user_id])

            user = User.find(params[:user_id])
        else
            user = User.first
        end

        user.games << game
        render json: user.games
    end

    def show
    end

end