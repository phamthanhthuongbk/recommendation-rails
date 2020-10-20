require './lib/recommendation.rb'

class User < ActiveRecord::Base
    has_many :liked_movies
    has_many :movies, through: :liked_movies
    has_many :user_friends
    has_many :friends, through: :user_friends

    include Recommendation
end
