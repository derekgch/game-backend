class SessionsController < ApplicationController
    def create
        user = User.find_by(user_name: params[:user_name])

        if (user && user.authenticate(params[:password]))
            render json: {
                user_name: user.user_name,
                id: user.id,
                token: get_token(payload( user.user_name, user.id ))
            } 
        else
            render json: { err: "Wrong Message" }, status: :unathorized
        end
    end

end
