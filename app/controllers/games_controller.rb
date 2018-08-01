class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games     
    end

    def create
        # byebug
        if(params[:type] == "multi")


        else


        end

        
        game = Game.create(points: params[:points], gametype: params[:type])

        if(params[:user_id])

            user = User.find(params[:user_id])
        else
            user = User.first
        end
        
        user.games << game
        render json: user.games
    end



    def top
        math_games = Game.all.select{|e| e.gametype == "math"}.sort{|a,b| b.points.to_i <=> a.points.to_i}
        
        word_games = Game.all.select{|e| e.gametype == "word"}.sort{|a,b| b.points.to_i <=> a.points.to_i}

        math_array = []
        math_games[0...5].each{ |e| math_array.push({user:e.users.map{|e| e.user_name}, point: e.points}) }

        word_array = []
        word_games[0...5].each{ |e| word_array.push({user:e.users.map{|e| e.user_name}, point: e.points}) }


        render json: {math: math_array, word:word_array}

    end

 

end