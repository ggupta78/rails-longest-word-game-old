class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters]

    @valid_answer = true
    @answer.split('').each do |letter|
      # if @letter.include? letter
    end
  end
end
