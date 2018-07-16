class Api::V1::GamesController < ApplicationController
    def index
        render json: {test:"test"}
    end
end