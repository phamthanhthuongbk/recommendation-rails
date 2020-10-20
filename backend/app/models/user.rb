require './lib/recommendation.rb'

class User < ActiveRecord::Base
    has_many :liked_movies
    has_many :movies, through: :liked_movies

    include Recommendation
end
