class SessionsController < ApplicationController
    def create
        token = get_token(payload("good", 2))
        render json: {token: token}
    end

end
