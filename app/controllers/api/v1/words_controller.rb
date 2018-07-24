class Api::V1::WordsController < ApplicationController
    def index
        render json: {test:"test"}
    end

end
