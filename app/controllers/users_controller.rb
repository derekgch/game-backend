class UsersController < ApplicationController
    def show
        if(requires_login && authorized?(params[:id]))
            user = User.find(params[:id])
            render json: {words: user.words, games: user.games }
        else
            render json: {message: "No!"}, status: :unathorized
        end
    end

    def create
        newUser ={
            user_name: params[:user_name],
            first_name: params[:first_name], 
            last_name: params[:last_name],
            password: params[:password],
            email: params[:email]
        }

        user = User.create(newUser)
        # byebug

        if user.valid?
            render json: {
                user: user,
                token: get_token(payload( user.user_name, user.id ))
            }
        else
            render json: user.errors , status: :unathorized
        end    
    end

    def update
        # byebug
        # if(requires_login && authorized?(params[:id]))
        #     user = User.find(params[:id])

        #     render json: {test: user}
        # else
        #     render json: {Err: "user.errors"}, status: :unathorized
        # end
            word = params[:word]
            user = User.find(params[:id])
            word = Word.find_by(word: word.downcase)
            user.words << word

            render json: {words: user.words}

    end

    
end
