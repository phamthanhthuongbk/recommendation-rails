class Movie < ActiveRecord::Base
    has_many :liked_movies
    has_many :users, through: :liked_movies
end