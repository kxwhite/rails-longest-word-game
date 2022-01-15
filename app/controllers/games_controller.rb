require "open-uri"

class GamesController < ApplicationController
  def new
    # @letters.each do |letter|
    #   letter = ('a'..'z').to_a.sample
    # end
    # @letters = ('a'..'z').to_a.sample(10).join
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
    @letters.shuffle!
  end

  def score
    @word = params[:user_word].upcase
    @english_word = english_word?(@word)
    # @letters = params[:letters]
    # @query = "https://wagon-dictionary.herokuapp.com/#{@word}"

    # if @word.include?(@letters.to_s) && @english_word
    #   "Congratulations!, #{@word} is a valid English word!"
    # else
    #   "Sorry but #{@word} does not seem to be a valid English word..."
    # end
  end

  # private

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end

# Check exist, part of array,
# fetch(https://wagon-dictionary.herokuapp.com/#{@query})
