require 'uri'
require 'net/http'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters]

    @valid_answer = @answer.split('').all? { |letter| @letters.include?(letter) }

    return unless @valid_answer

    uri = URI("https://wagon-dictionary.herokuapp.com/#{@answer}")
    res = Net::HTTP.get_response(uri)
    result = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
    # raise
    @valid_word = result['found'] == true

    if @valid_word && session[:user_score]
      @current_score = session[:user_score]
      @current_score += 1
    else
      @current_score = 1
    end
    session[:user_score] = @current_score
  end
end
