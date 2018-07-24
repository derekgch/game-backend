class Api::V1::WordsController < ApplicationController
    def index
        word = Word.random(true)
        render json: {word:word}
    end

    def long
        word = Word.random(false)
        render json: {word:word}
    end


    def hard
        word = Word.random_hard()
        render json: {word:word}
    end

end
