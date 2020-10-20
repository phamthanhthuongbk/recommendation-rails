module Recommendation
    def recommend_movies # recommend movies to a user
      # find all other users, equivalent to .where(‘id != ?’, self.id)
      other_users = self.class.all.where.not(id: self.id)
      # instantiate a new hash, set default value for any keys to 0
      recommended = Hash.new(0)
      # for each user of all other users
      other_users.each do |user|
        # find the movies this user and another user both liked
        common_movies = user.movies & self.movies
        # calculate the weight (recommendation rating)
        weight = common_movies.size.to_f / user.movies.size
        # add the extra movies the other user liked
        common_movie_ids = common_movies.pluck(:id)
        user.movies.each do |movie|
          next if common_movie_ids.include? movie.id
          # put the movie along with the cumulative weight into hash
          recommended[movie] += weight
        end
      end
      # sort by weight in descending order
      sorted_recommended = recommended.sort_by { |key, value| value }.reverse
    end
end